//TODO: Register in dependency injection
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/repository/user_repository.dart';

class FirebaseRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final UserRepository _userRepository = getit<UserRepository>();
}
