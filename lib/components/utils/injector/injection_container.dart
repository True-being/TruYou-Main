import 'package:get_it/get_it.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/services/provider_service.dart';

final getit = GetIt.instance;

class DependencyInjection {
  static void init() {
    //Repositories
    getit.registerLazySingleton<UserRepository>(() => UserRepository());
    getit.registerLazySingleton<CloudFunctionRepository>(
        () => CloudFunctionRepository());
    //Blocs
    getit.registerFactory(() => AuthBloc(userRepository: getit()));
    //Services
    getit.registerLazySingleton<UserProvider>(() => UserProvider());
  }
}
