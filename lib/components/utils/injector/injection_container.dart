import 'package:get_it/get_it.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/bloc/find_matches_bloc/find_matches_bloc.dart';
import 'package:truyou/bloc/gender_age_bloc/gender_age_bloc.dart';
import 'package:truyou/bloc/location_bloc/location_bloc.dart';
import 'package:truyou/bloc/my_matches_bloc/my_matches_bloc.dart';
import 'package:truyou/bloc/swipe_bloc/swipe_bloc.dart';
import 'package:truyou/bloc/unmatch_bloc/unmatch_bloc.dart';
import 'package:truyou/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/firebase_repository.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/services/provider_service.dart';

final getit = GetIt.instance;

class DependencyInjection {
  static void init() {
    //Repositories
    getit.registerLazySingleton<UserRepository>(() => UserRepository());
    getit.registerLazySingleton<CloudFunctionRepository>(
        () => CloudFunctionRepository());
    getit.registerLazySingleton(() => FirebaseRepository());
    //Blocs
    getit.registerFactory(() => AuthBloc(userRepository: getit()));
    getit.registerFactory(() => FindMatchesBloc(firebaseRepository: getit()));
    getit.registerFactory(() => SwipeBloc(firebaseRepository: getit()));
    getit.registerFactory(() => UserProfileBloc(userRepository: getit()));
    getit.registerFactory(() => MyMatchesBloc(firebaseRepository: getit()));
    getit.registerFactory(() => UnmatchBloc(firebaseRepository: getit()));
    getit.registerFactory(() => LocationBloc(firebaseRepository: getit()));
    getit.registerFactory(() => GenderAgeBloc(firebaseRepository: getit()));
    //Services
    getit.registerLazySingleton<UserProvider>(() => UserProvider());
  }
}
