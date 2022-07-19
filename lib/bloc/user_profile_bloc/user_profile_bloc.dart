import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/user_repository.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';
part 'user_profile_bloc.freezed.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepository userRepository;

  UserProfileBloc({required this.userRepository})
      : super(const UserProfileState.initial()) {
    on<_LoadMyProfile>(_loadMyProfile);
  }

  Future<void> _loadMyProfile(
      _LoadMyProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileState.loading());
    try {
      final user = await userRepository.getUserInfo();
      //TODO: Add error dialogs
      //TODO: Add getAddress from lat and lon
      // final location= await Geocoder2.getDataFromCoordinates(latitude: user.location!.latitude, longitude: user.location!.longitude, googleMapApiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'));
      // print(location.city);
      // print(location.country);
      emit(UserProfileState.success(user, 'New York, USA'));
    } catch (_e) {
      emit(UserProfileState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }
}
