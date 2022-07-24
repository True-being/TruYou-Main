import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/components/utils/geo_helper/geo_helper.dart';
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
    on<_LoadedProfile>(_loadedProfile);
  }

  late StreamSubscription _subscription;

  Future<void> _loadMyProfile(
      _LoadMyProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileState.loading());
    try {
      _subscription = userRepository
          .getUserInfoAsStream()
          .listen((user) => add(UserProfileEvent.loadedProfile(user)));
    } catch (_e) {
      emit(UserProfileState.failed(ExceptionHandler.catchErrors(_e)));
    }
  }

  Future<void> _loadedProfile(
      _LoadedProfile event, Emitter<UserProfileState> emit) async {
    final address =
        await GeoHelper.findAddressFromLocation(event.user.location);
    emit(UserProfileState.success(event.user, address));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
