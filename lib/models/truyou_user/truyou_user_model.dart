import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/widgets/swipe_card.dart';

part 'truyou_user_model.freezed.dart';

@freezed
abstract class TruYouUser with _$TruYouUser {
  const TruYouUser._();

  const factory TruYouUser({
    required DocumentSnapshot? documentSnapshot,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime createdAt,
    required DateTime? lastDate,
    required bool? isWalletVerified,
    required bool hasCompletedUsers,
    required DateTime birthDate,
    required String? algoWalletAddress,
    required String? aboutMe,
    required String? lifeStyle,
    required String? job,
    required String? companyName,
    required GeoPoint? location,
    required String? generalLocation,
    required List<String>? images,
    required String? gender,
    required String? sexualOrientation,
    required String? genderPreference,
    required String? sexualityPreference,
    required DateTime? lowerAgePreference,
    required DateTime? upperAgePreference,
    required int? radiusDistance,
    required bool? isRadiusDistanceSelected,
  }) = _TruYouUser;

  factory TruYouUser.fromJson(
      DocumentSnapshot doc, Map<String, dynamic>? user) {
    var lastDate = user!['lastDate'];
    return TruYouUser(
        documentSnapshot: doc,
        firstName: user['firstName'],
        lastName: user['lastName'],
        email: user['email'],
        createdAt: (user['createdAt'] as Timestamp).toDate(),
        lastDate: lastDate != null
            ? (user['lastDate'] as Timestamp).toDate()
            : lastDate,
        isWalletVerified: user['isWalletVerified'],
        hasCompletedUsers: user['hasCompletedUsers'],
        birthDate: (user['birthDate'] as Timestamp).toDate(),
        algoWalletAddress: user['algoWalletAddress'],
        aboutMe: user['aboutMe'],
        lifeStyle: user['lifeStyle'],
        job: user['job'],
        companyName: user['companyName'],
        location: user['location'],
        //TODO: Change to fit update once users are created with general location
        generalLocation: user['generalLocation'] ?? '',
        images:
            (user['images'] as List).map((image) => image.toString()).toList(),
        gender: user['gender'],
        sexualOrientation: user['sexualOrientation'],
        genderPreference: user['genderPreference'],
        sexualityPreference: user['sexualityPreference'],
        lowerAgePreference: (user['lowerAgePreference'] as Timestamp).toDate(),
        upperAgePreference: (user['upperAgePreference'] as Timestamp).toDate(),
        radiusDistance: user['radiusDistance'],
        isRadiusDistanceSelected: user['isRadiusDistanceSelected']);
  }
}

extension TruYouUserToJson on TruYouUser {
  Map<String, dynamic> toJson() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'email': this.email,
      'createdAt': this.createdAt,
      'lastDate': this.lastDate,
      'isWalletVerified': this.isWalletVerified,
      'hasCompletedUsers': this.hasCompletedUsers,
      'birthDate': this.birthDate,
      'algoWalletAddress': this.algoWalletAddress,
      'aboutMe': this.aboutMe,
      'lifeStyle': this.lifeStyle,
      'job': this.job,
      'generalLocation': this.generalLocation,
      'companyName': this.companyName,
      'location': this.location,
      'gender': this.gender,
      'sexualOrientation': this.sexualOrientation,
      'genderPreference': this.genderPreference,
      'sexualityPreference': this.sexualityPreference,
      'lowerAgePreference': this.lowerAgePreference,
      'upperAgePreference': this.upperAgePreference,
      'radiusDistance': this.radiusDistance,
      'isRadiusDistanceSelected': this.isRadiusDistanceSelected,
    };
  }
}

extension AsSwipeCard on List<TruYouUser> {
  List<SwipeCard> asSwipeCards() {
    var swipeList = <SwipeCard>[];
    final now = DateTime.now();
    for (var user in this) {
      final age = ((now.difference(user.birthDate).inDays) ~/ 365).toInt();
      swipeList.add(SwipeCard(
        title: '${user.firstName} ${user.lastName},$age',
        description: '${user.job}',
        image: user.images!.first,
      ));
    }
    return swipeList;
  }
}
