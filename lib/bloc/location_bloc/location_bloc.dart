import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/repository/firebase_repository.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final FirebaseRepository firebaseRepository;

  LocationBloc({required this.firebaseRepository})
      : super(const LocationState.initial()) {
    on<_UpdateLocation>(_updateLocation);
    on<_UpdateMatchingDistance>(_updateMatchingDistance);
    on<_UpdateRadiusDistanceSelected>(_updateRadiusDistanceSelected);
  }

  //TODO: Reset last date in firebase repository - Create function

  Future<void> _updateLocation(
      _UpdateLocation event, Emitter<LocationState> emit) async {
    emit(LocationState.loading());
    try {
      await firebaseRepository.updateLocation(event.location);
      emit(LocationState.success());
    } catch (exception) {
      emit(LocationState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }

  Future<void> _updateMatchingDistance(
      _UpdateMatchingDistance event, Emitter<LocationState> emit) async {
    emit(LocationState.loading());
    try {
      await firebaseRepository.updateMatchingDistance(event.distance);
      emit(LocationState.success());
    } catch (exception) {
      emit(LocationState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }

  Future<void> _updateRadiusDistanceSelected(
      _UpdateRadiusDistanceSelected event, Emitter<LocationState> emit) async {
    emit(LocationState.loading());
    try {
      await firebaseRepository
          .updateRadiusDistanceSelected(event.isRadiusDistanceSelected);
      emit(LocationState.success());
    } catch (exception) {
      emit(LocationState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }
}
