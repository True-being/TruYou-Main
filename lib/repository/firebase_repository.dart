import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/utils/exceptions/exceptions.dart';
import 'package:truyou/components/utils/geo_helper/geo_helper.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/utils/tuple/tuple.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/screens/find-matches/find_matches.dart';
import 'package:truyou/screens/find-matches/its_a_match_screen.dart';

class FirebaseRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final UserRepository _userRepository = getit<UserRepository>();
  final CloudFunctionRepository _cloudFunctionRepository =
      getit<CloudFunctionRepository>();

  ///Query documents limit
  static const _queryDocLimit = 3;

  ///Loads new users within a range
  Future<List<TruYouUser>> loadMoreSwipeUsers(
      DateTime? lastDate, Cursor cursor) async {
    //* Get trust from local storage
    //* if (trustLeft == 0) return [];
    //* Throw error to show get more trust

    final currentUser = _userRepository.getCurrentUser();
    final userInfo = await _userRepository.getUserInfo();

    late int radiusDistance;

    if (userInfo.isRadiusDistanceSelected!) {
      radiusDistance = userInfo.radiusDistance!;
    } else {
      radiusDistance = 100;
    }

    var users = <TruYouUser>[];

    var queryBase = _instance
        .collection('users')
        .where('sexualOrientation', isEqualTo: userInfo.sexualityPreference);

    if (userInfo.genderPreference != 'Everyone') {
      queryBase =
          queryBase.where('gender', isEqualTo: userInfo.genderPreference);
    }

    Query<Map<String, dynamic>> lastUIDQuery;
    if (lastDate != null) {
      print(lastDate);
      Query<Map<String, dynamic>> startAtQuery = queryBase
          .where('createdAt', isGreaterThanOrEqualTo: lastDate)
          .orderBy('createdAt', descending: false)
          .startAt([lastDate]).limit(_queryDocLimit);
      Query<Map<String, dynamic>> startAfterQuery = queryBase
          .where('createdAt', isGreaterThanOrEqualTo: lastDate)
          .orderBy('createdAt', descending: false)
          .startAfter([lastDate]).limit(_queryDocLimit);

      if (userInfo.hasCompletedUsers) {
        lastUIDQuery = startAfterQuery;
      } else {
        switch (cursor) {
          case Cursor.startAt:
            print('STARTED AT');
            lastUIDQuery = startAtQuery;
            break;
          case Cursor.startAfter:
            print('STARTED AFTER');
            lastUIDQuery = startAfterQuery;
            break;
        }
      }
    } else {
      print('INSIDE INITIAL');
      lastUIDQuery = queryBase
          .orderBy('createdAt', descending: false)
          .limit(_queryDocLimit);
    }

    //TODO: Limit to trust
    final querySnapshot = await lastUIDQuery.get();

    var locationUsers = <TruYouUser>[];

    for (var doc in querySnapshot.docs) {
      final hasSeenUser = await hasSeenUserBefore(doc.id);
      if (!hasSeenUser) {
        final truYouUser = TruYouUser.fromJson(doc, doc.data());
        locationUsers.add(truYouUser);
      }
    }

    final locationSortedUsers = GeoHelper.sortTruYouUsersByLocation(
        radiusDistance, userInfo, locationUsers);

    for (var truYouUser in locationSortedUsers) {
      if (truYouUser.documentSnapshot?.id != currentUser?.uid) {
        if (truYouUser.birthDate.isBefore(userInfo.lowerAgePreference!) &&
            truYouUser.birthDate.isAfter(userInfo.upperAgePreference!)) {
          users.add(truYouUser);
        }
      }
    }

    if (users.isEmpty) {
      //TODO: In settings, if user changes their settings set "hasCompletedUsers" to false
      await _instance
          .collection('users')
          .doc(currentUser?.uid)
          .update({'hasCompletedUsers': true});
      throw NoMoreUserAvailableException();
    }

    return users;
  }

  Future<bool> swipeRight(BuildContext context, TruYouUser swipedUser) async {
    //TODO: Execute smart contract
    final user = _userRepository.getCurrentUser();
    final swipedUserUID = swipedUser.documentSnapshot?.id;
    print("YOUR UID: ${user?.uid}");
    print("SWIPED USER UID: $swipedUserUID");
    //Check if you are in the the [TruYouUser swipedUser]'s collection
    final query = await _instance
        .collection('users')
        .doc(swipedUserUID)
        .collection('swipes')
        .where('uid', isEqualTo: user?.uid)
        .get();
    //Checks if you have confirmed match with [TruYouUser swipedUser]
    final hasMatched = query.docs.length >= 1;
    if (hasMatched) {
      Navigator.push(context, ItsAMatchScreen.route());
      print('Cloud function executing');
      await _cloudFunctionRepository.confirmedMatch(user?.uid, swipedUserUID);
      print('Cloud function complete...');
      //TODO: Send offline user a notification
    } else {
      final ids = await _instance
          .collection('users')
          .doc(user?.uid)
          .collection('swipes')
          .where('uid', isEqualTo: swipedUserUID)
          .get();
      final doesIDExist = ids.docs.length >= 1;
      if (!doesIDExist)
        await _instance
            .collection('users')
            .doc(user?.uid)
            .collection('swipes')
            .add({'uid': swipedUserUID, 'type': 'match'});
    }

    return hasMatched;
  }

  Future<void> swipeLeft(TruYouUser swipedUser) async {
    //TODO: Execute smart contract
    final user = _userRepository.getCurrentUser();
    final swipedUserUID = swipedUser.documentSnapshot?.id;
    print("YOUR UID: ${user?.uid}");
    print("SWIPED USER UID: $swipedUserUID");
    //Check if you are in the the [TruYouUser swipedUser]'s collection
    final query = await _instance
        .collection('users')
        .doc(swipedUserUID)
        .collection('misses')
        .where('uid', isEqualTo: user?.uid)
        .get();
    //Checks if you have confirmed miss with [TruYouUser swipedUser]
    final hasMissed = query.docs.length >= 1;
    if (hasMissed) {
      print('Cloud function executing');
      await _cloudFunctionRepository.confirmedMiss(user?.uid, swipedUserUID);
      print('Cloud function complete...');
      //TODO: Send offline user a notification
    } else {
      final ids = await _instance
          .collection('users')
          .doc(user?.uid)
          .collection('swipes')
          .where('uid', isEqualTo: swipedUserUID)
          .get();
      final doesIDExist = ids.docs.length >= 1;
      if (!doesIDExist)
        await _instance
            .collection('users')
            .doc(user?.uid)
            .collection('swipes')
            .add({'uid': swipedUserUID, 'type': 'miss'});
    }
  }

  Future<Tuple2<DocumentSnapshot, List<TruYouUser>>> loadMoreMatches(
      DocumentSnapshot? documentSnapshot,
      List<TruYouUser> previousUsers) async {
    final user = _userRepository.getCurrentUser();

    var matches = <TruYouUser>[];

    final query = _instance
        .collection('users')
        .doc(user?.uid)
        .collection('swipes')
        .where('type', isEqualTo: 'confirmedMatch')
        .limit(6);

    final matchesQuery = documentSnapshot != null
        ? await query.startAfterDocument(documentSnapshot).get()
        : await query.get();

    if (matchesQuery.docs.isEmpty)
      return Tuple2(documentSnapshot, previousUsers);

    final ref = matchesQuery.docs.last;

    matches.addAll(previousUsers);

    for (var doc in matchesQuery.docs) {
      final userData =
          await _instance.collection('users').doc(doc.data()['uid']).get();
      final truYouUser = TruYouUser.fromJson(userData, userData.data());
      matches.add(truYouUser);
    }

    return Tuple2(ref, matches);
  }

  Future<void> unmatch(TruYouUser matchedUser) async {
    final user = _userRepository.getCurrentUser();
    final matchedUserUID = matchedUser.documentSnapshot?.id;
    return await _cloudFunctionRepository.unmatch(user?.uid, matchedUserUID);
  }

  Future<void> updateLocation(GeoPoint location) async {
    final user = _userRepository.getCurrentUser();
    return await _instance.collection('users').doc(user?.uid).update(
        {'location': location, 'lastDate': null, 'hasCompletedUsers': false});
  }

  Future<void> updateMatchingDistance(int distance) async {
    final user = _userRepository.getCurrentUser();
    return await _instance.collection('users').doc(user?.uid).update({
      'radiusDistance': distance,
      'lastDate': null,
      'hasCompletedUsers': false
    });
  }

  Future<void> updateRadiusDistanceSelected(
      bool isRadiusDistanceSelected) async {
    final user = _userRepository.getCurrentUser();
    return await _instance.collection('users').doc(user?.uid).update({
      'isRadiusDistanceSelected': isRadiusDistanceSelected,
      'lastDate': null,
      'hasCompletedUsers': false
    });
  }

  Future<void> updateLastDate(DateTime? lastDate) async {
    final firebaseUser = _userRepository.getCurrentUser();
    return await _instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({'lastDate': lastDate});
  }

  Future<void> updateGenderPreference(String genderPreference) async {
    final firebaseUser = _userRepository.getCurrentUser();
    return await _instance.collection('users').doc(firebaseUser?.uid).update({
      'genderPreference': genderPreference,
      'lastDate': null,
      'hasCompletedUsers': false
    });
  }

  Future<void> updateAgePreferences(
      DateTime lowerAge, DateTime upperAge) async {
    final firebaseUser = _userRepository.getCurrentUser();
    return await _instance.collection('users').doc(firebaseUser?.uid).update({
      'lowerAgePreference': lowerAge,
      'upperAgePreference': upperAge,
      'lastDate': null,
      'hasCompletedUsers': false
    });
  }

  Future<bool> hasSeenUserBefore(String? uid) async {
    final user = _userRepository.getCurrentUser();

    var query = await _instance
        .collection('users')
        .doc(user?.uid)
        .collection('swipes')
        .where('uid', isEqualTo: uid)
        .get();

    return query.docs.length >= 1;
  }
}
