import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/components/utils/exceptions/failure_type.dart';
import 'package:truyou/components/utils/geo_helper/geo_helper.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/firebase_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_matches_event.dart';
part 'my_matches_state.dart';
part 'my_matches_bloc.freezed.dart';

class MyMatchesBloc extends Bloc<MyMatchesEvent, MyMatchesState> {
  final FirebaseRepository firebaseRepository;

  MyMatchesBloc({required this.firebaseRepository})
      : super(MyMatchesState.initial()) {
    on<_LoadMoreMatches>(_loadMoreMatches);
  }

  Future<void> _loadMoreMatches(
      _LoadMoreMatches event, Emitter<MyMatchesState> emit) async {
    if (event.previousUsers.isEmpty) emit(MyMatchesState.loading());
    try {
      final tuple = await firebaseRepository.loadMoreMatches(
          event.documentSnapshot, event.previousUsers);

      final locations = await GeoHelper.findAddressesFromLocationList(tuple.t2);

      emit(MyMatchesState.success(tuple.t1, tuple.t2, locations));
    } catch (exception) {
      emit(MyMatchesState.failed(FailureType.unknownException(exception)));
    }
  }
}
