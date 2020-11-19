import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';

class NewestBloc extends Bloc<NewestEvent, NewestState> {
  final TrainingRepository _repository;
  StreamSubscription _streamSubscription;
  List<TrainingEntity> trainings = [];

  NewestBloc(TrainingRepository repository)
      : assert(repository != null),
        _repository = repository,
        super(NewestStateUninitialized());

  @override
  Stream<NewestState> mapEventToState(NewestEvent event) async* {
    if (event is NewestEventLoad) {
      yield* _mapToLoadState();
    } else if (event is NewestEventUpdate) {
      print("to update newesss");
      yield* _mapToUpdateState();
    }
  }

  Stream<NewestState> _mapToLoadState() async* {
    yield NewestStateLoading();
    _streamSubscription?.cancel();
    _streamSubscription = _repository.getNewest().listen((event) {
      trainings = event;
      add(NewestEventUpdate());
    });
  }

  Stream<NewestState> _mapToUpdateState() async* {
    yield NewestStateLoaded(trainings);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

//state
abstract class NewestState extends Equatable {
  const NewestState();

  @override
  List<Object> get props => [];
}

class NewestStateUninitialized extends NewestState {}

class NewestStateLoading extends NewestState {}

class NewestStateLoaded extends NewestState {
  final List<TrainingEntity> trainings;
  const NewestStateLoaded(this.trainings);

  @override
  List<Object> get props => [trainings];

  @override
  String toString() {
    return "T: ${trainings.length}";
  }
}

//event
abstract class NewestEvent {
  const NewestEvent();
}

class NewestEventLoad extends NewestEvent {}

class NewestEventUpdate extends NewestEvent {}
