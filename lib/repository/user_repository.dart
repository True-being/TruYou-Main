import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:truyou/models/auth_user_model.dart';

//Firebase Firestore rules
// if isSignedIn() && isUserData(userId)

//Firebase Storage Rules
// rules_version = '2';
//       service firebase.storage {
//         match /b/{bucket}/o {
//            match /{userId}/{fileTypes}/{allFiles=**}{
//              allow read;
//              allow write: if authenticated() && request.auth.uid == userId;
//           }
//       }
// }

// function authenticated() {
//    return request.auth.uid != null;
// }

///Contains all methods for user and auth related functionality
class UserRepository {
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseStorage _storageInstance = FirebaseStorage.instance;

  ///Sign in user with email and password
  Future<User?> signInUserEmailAndPassword(
      String email, String password) async {
    final authResult = await _authInstance.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  ///Sign up user with email and password
  Future<User?> signUpUserEmailAndPassword(
      AuthUser user, List<File> images, String password) async {
    //Registers the user
    final authResult = await _authInstance.createUserWithEmailAndPassword(
        email: user.email, password: password);

    if (authResult.user != null) {
      final urls = await _uploadFiles(images, authResult.user!.uid);

      var userData = user.toJson()..addAll({'images': urls});

      //Adds the users details to the Firestore datatbase
      await _firestoreInstance
          .collection('users')
          .doc(authResult.user?.uid)
          .set(userData);
    }

    return authResult.user;
  }

  ///Checks if Alg address already exists
  Future<bool> doesAddressAlreadyExist(String address) async {
    final users = await _firestoreInstance
        .collection('users')
        .where('algoWalletAddress', isEqualTo: address)
        .get();
    print(users.docs.length);
    return users.docs.length >= 1;
  }

  ///Checks if email address already exists
  Future<bool> doesEmailAlreadyExist(String email) async {
    final users = await _firestoreInstance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return users.docs.length >= 1;
  }

  //Uploads all files to Firebase storage and returns their URLS
  Future<List<String>> _uploadFiles(List<File> images, String uid) async {
    var imageUrls =
        await Future.wait(images.map((image) => _uploadFile(uid, image)));
    print('Firebase storage URLS');
    print(imageUrls);
    return imageUrls;
  }

  //Uploads a single file to Firebase storage and returns its URL
  Future<String> _uploadFile(String uid, File image) async {
    final path = image.path;
    final imageName = path.substring((path.lastIndexOf('/') + 1), path.length);
    final storageReference = _storageInstance.ref().child('$uid/$imageName');
    final uploadTask = storageReference.putFile(image);
    final taskSnapshot = await uploadTask;

    return await taskSnapshot.ref.getDownloadURL();
  }

  ///Gets the current user
  User? getCurrentUser() {
    return _authInstance.currentUser;
  }

  ///Reset the users
  Future<void> resetPassword(String email) async {
    return await _authInstance.sendPasswordResetEmail(email: email);
  }

  ///Sign out
  Future<void> signOut() async {
    return await _authInstance.signOut();
  }
}
