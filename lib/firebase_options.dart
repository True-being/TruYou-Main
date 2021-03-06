// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1lHjEvmFuIVqe3CmKrL8_XByV69vUtO0',
    appId: '1:490865030490:web:fb89bdfa46b0d63219ef63',
    messagingSenderId: '490865030490',
    projectId: 'truyou-50ae9',
    authDomain: 'truyou-50ae9.firebaseapp.com',
    storageBucket: 'truyou-50ae9.appspot.com',
    measurementId: 'G-DFH70XGEG9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWKTJSezHFCzWOy7xlgunfXBXGNEJPif0',
    appId: '1:490865030490:android:ff1a069b4f0696d519ef63',
    messagingSenderId: '490865030490',
    projectId: 'truyou-50ae9',
    storageBucket: 'truyou-50ae9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZNSkOvpJxJg7C9LbBzsLcfnkVPWsBGLo',
    appId: '1:490865030490:ios:fbdd3e39283b99bf19ef63',
    messagingSenderId: '490865030490',
    projectId: 'truyou-50ae9',
    storageBucket: 'truyou-50ae9.appspot.com',
    iosClientId: '490865030490-m9koo5kf9ek9ahi99dlbn10lqf3uc2nj.apps.googleusercontent.com',
    iosBundleId: 'com.example.truyou',
  );
}
