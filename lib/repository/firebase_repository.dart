import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/utils/exceptions/exceptions.dart';
import 'package:truyou/components/utils/geo_helper/geo_helper.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/screens/find-matches/find_matches.dart';
import 'package:truyou/screens/find-matches/its_a_match_screen.dart';

//TODO: Merge matches, misses, confirmedMatches, confirmedMisses into one collection to reduces reads
//TODO: On every user check if their UID lies in the SWIPES COLLECTION
//TODO: Change last date functionality to last UID
//TODO: Create a get all matches query. This will return a list of UID's. Get all the associated user documents to these UID's

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
      radiusDistance = 1000;
    }

    var users = <TruYouUser>[];

    final queryBase = _instance
        .collection('users')
        .where('gender', isEqualTo: userInfo.genderPreference)
        .where('sexualOrientation', isEqualTo: userInfo.sexualityPreference);

    Query<Map<String, dynamic>> lastUIDQuery;

    //////////////////////////////////////////////////////////////////////////////////////////

    //TODO: Check issue with last date when next users are called for

    //Sets parameters for the query
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
            lastUIDQuery = startAtQuery;
            break;
          case Cursor.startAfter:
            lastUIDQuery = startAfterQuery;
            break;
        }
      }
    } else {
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

  Future<List<TruYouUser>> loadMoreMatches(
      List<TruYouUser> previousUsers) async {
    final user = _userRepository.getCurrentUser();
    final documentSnapshot =
        previousUsers.isNotEmpty ? previousUsers.last.documentSnapshot : null;

    var matches = <TruYouUser>[];

    matches.addAll(previousUsers);

    final query = _instance
        .collection('users')
        .doc(user?.uid)
        .collection('swipes')
        .where('type', isEqualTo: 'confirmedMatch')
        .limit(10);

    final querySnapshot = documentSnapshot != null
        ? await query.startAfterDocument(documentSnapshot).get()
        : await query.get();

    print(querySnapshot.docs.length);

    for (var doc in querySnapshot.docs) {
      final userData =
          await _instance.collection('users').doc(doc.data()['uid']).get();
      final truYouUser = TruYouUser.fromJson(userData, userData.data());
      matches.add(truYouUser);
    }

    return matches;
  }

  Future<void> updateLastDate(DateTime? lastDate) async {
    print('UPDATING USER LAST UID');
    final firebaseUser = _userRepository.getCurrentUser();
    try {
      _instance
          .collection('users')
          .doc(firebaseUser?.uid)
          .update({'lastDate': lastDate});
    } catch (e) {
      print(e);
    }
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
