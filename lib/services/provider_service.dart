import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  final StreamController<User> userController = new StreamController<User>();

  UserProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? event) {
      if (event != null) userController.sink.add(event);
    });
  }

  void dispose() {
    userController.close();
  }
}
