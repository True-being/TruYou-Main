import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/repository/firebase_repository.dart';

part 'gender_age_state.dart';
part 'gender_age_event.dart';
part 'gender_age_bloc.freezed.dart';

class GenderAgeBloc extends Bloc<GenderAgeEvent, GenderAgeState> {
  final FirebaseRepository firebaseRepository;

  GenderAgeBloc({required this.firebaseRepository})
      : super(const GenderAgeState.initial()) {
    on<_UpdateAgePreferences>(_updateAgePreferences);
    on<_UpdateGenderPreference>(_updateGenderPreference);
  }

  Future<void> _updateAgePreferences(
      _UpdateAgePreferences event, Emitter<GenderAgeState> emit) async {
    emit(GenderAgeState.loading());
    try {
      await firebaseRepository.updateAgePreferences(
          event.lowerAge, event.upperAge);
      emit(GenderAgeState.success());
    } catch (exception) {
      emit(GenderAgeState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }

  Future<void> _updateGenderPreference(
      _UpdateGenderPreference event, Emitter<GenderAgeState> emit) async {
    emit(GenderAgeState.loading());
    try {
      await firebaseRepository.updateGenderPreference(event.genderPreference);
      emit(GenderAgeState.success());
    } catch (exception) {
      emit(GenderAgeState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }
}
