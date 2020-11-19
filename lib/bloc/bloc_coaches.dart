import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/coach/coach_entity.dart';
import 'package:flutter_tv/repositories/coach_repository.dart';

class CoachesBloc extends Bloc<CoachEvent, CoachState> {
  final CoachRepository _coachRepository;
  StreamSubscription _streamSubscription;

  List<CoachEntity> coachesList = [];

  CoachesBloc(CoachRepository equipmentRepository)
      : assert(equipmentRepository != null),
        _coachRepository = equipmentRepository,
        super(CoachState.UNINITIALIZED);

  @override
  Stream<CoachState> mapEventToState(CoachEvent event) async* {
    switch (event) {
      case CoachEvent.LOAD:
        yield* _mapToLoad();
        break;
      case CoachEvent.UPDATE:
        yield* _mapToUpdate();
        break;
    }
  }

  Stream<CoachState> _mapToLoad() async* {
    yield CoachState.LOADING;

    _streamSubscription?.cancel();
    _streamSubscription = _coachRepository.getAll().listen((event) {
      coachesList = event;
      add(CoachEvent.UPDATE);
    });
  }

  Stream<CoachState> _mapToUpdate() async* {
    yield CoachState.LOADED;
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

//states
enum CoachState { UNINITIALIZED, LOADING, LOADED }
//events
enum CoachEvent { LOAD, UPDATE }
