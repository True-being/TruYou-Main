import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/firebase_repository.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';
part 'swipe_bloc.freezed.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final FirebaseRepository firebaseRepository;

  SwipeBloc({required this.firebaseRepository})
      : super(const SwipeState.initial()) {
    on<_SwipeRight>(swipeRight);
    on<_SwipeLeft>(swipeLeft);
  }

  Future<void> swipeRight(_SwipeRight event, Emitter<SwipeState> emit) async {
    emit(const SwipeState.loading());
    try {
      var hasMatched =
          await firebaseRepository.swipeRight(event.context, event.user);
      await firebaseRepository.updateLastDate(event.lastDate);
      emit(SwipeState.swipeRightCompleted(hasMatched));
    } catch (exception) {
      emit(SwipeState.failed(FailureType.unknownException(exception)));
    }
  }

  Future<void> swipeLeft(_SwipeLeft event, Emitter<SwipeState> emit) async {
    emit(const SwipeState.loading());
    try {
      await firebaseRepository.swipeLeft(event.user);
      await firebaseRepository.updateLastDate(event.lastDate);
      emit(SwipeState.swipeLeftCompleted());
    } catch (exception) {
      emit(SwipeState.failed(FailureType.unknownException(exception)));
    }
  }
}
