import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';

class GeoHelper {
  static List<TruYouUser> sortTruYouUsersByLocation(
      int matchingDistance, TruYouUser currentUser, List<TruYouUser> users) {
    List<Map<dynamic, dynamic>> distances = [];
    var sortedUsers = <TruYouUser>[];

    for (int i = 0; i < users.length; i++) {
      int distance =
          _distanceFromMyLocation(currentUser.location!, users[i].location!);
      if (distance <= matchingDistance)
        distances.add({'index': i, 'distance': distance});
    }

    distances.sort((a, b) {
      int d1 = a['distance'] as int;
      int d2 = b['distance'] as int;
      if (d1 > d2)
        return 1;
      else if (d1 < d2)
        return -1;
      else
        return 0;
    });

    for (var distance in distances) {
      sortedUsers.add(users[distance['index']]);
    }

    return sortedUsers;
  }

  static Future<String> _findAddressFromLocation(GeoPoint? location) async {
    final address =
        await placemarkFromCoordinates(location!.latitude, location.longitude);
    return '${address.first.locality}, ${address.first.country}';
  }

  static Future<List<String>> findAddressesFromLocationList(
      List<TruYouUser> users) async {
    var addresses = <String>[];

    for (var user in users) {
      addresses.add(await _findAddressFromLocation(user.location));
    }

    return addresses;
  }

  static int _distanceFromMyLocation(
      GeoPoint currentGeoPoint, GeoPoint userGeoPoint) {
    double distance = Geolocator.distanceBetween(
        currentGeoPoint.latitude,
        currentGeoPoint.longitude,
        userGeoPoint.latitude,
        userGeoPoint.longitude);
    return distance ~/ 1000.toInt();
  }
}
