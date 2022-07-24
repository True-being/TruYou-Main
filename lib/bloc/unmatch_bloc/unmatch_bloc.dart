import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/repository/firebase_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unmatch_state.dart';
part 'unmatch_event.dart';
part 'unmatch_bloc.freezed.dart';

class UnmatchBloc extends Bloc<UnmatchEvent, UnmatchState> {
  final FirebaseRepository firebaseRepository;

  UnmatchBloc({required this.firebaseRepository})
      : super(const UnmatchState.initial()) {
    on<_Unmatch>(_unmatch);
  }

  Future<void> _unmatch(_Unmatch event, Emitter<UnmatchState> emit) async {
    emit(const UnmatchState.loading());
    try {
      await firebaseRepository.unmatch(event.matchedUser);
      emit(UnmatchState.success());
    } catch (exception) {
      emit(UnmatchState.failed(ExceptionHandler.catchErrors(exception)));
    }
  }
}
