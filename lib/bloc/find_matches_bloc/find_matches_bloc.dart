import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/exceptions/exceptions.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/firebase_repository.dart';
import 'package:truyou/screens/find-matches/find_matches.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_matches_event.dart';
part 'find_matches_state.dart';
part 'find_matches_bloc.freezed.dart';

class FindMatchesBloc extends Bloc<FindMatchesEvent, FindMatchesState> {
  final FirebaseRepository firebaseRepository;

  FindMatchesBloc({required this.firebaseRepository})
      : super(const FindMatchesState.initial()) {
    on<_LoadMoreMatches>(_loadMoreMatches);
  }

  Future<void> _loadMoreMatches(
      _LoadMoreMatches event, Emitter<FindMatchesState> emit) async {
    emit(const FindMatchesState.loading());
    await Future.delayed(Duration(seconds: 3));
    try {
      var users = await firebaseRepository.loadMoreSwipeUsers(
          event.lastDate, event.cursor);
      await firebaseRepository.updateLastDate(users.first.createdAt);
      emit(FindMatchesState.success(users));
    } on NoMoreUserAvailableException catch (_) {
      emit(FindMatchesState.failed(FailureType.noMoreUserAvailable()));
    } catch (exception) {
      print(exception);
      emit(FindMatchesState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }
}
