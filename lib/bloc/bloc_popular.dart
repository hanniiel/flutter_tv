import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final TrainingRepository _repository;
  StreamSubscription __streamSubscription;
  List<TrainingEntity> trainings = [];

  PopularBloc(TrainingRepository repository)
      : assert(repository != null),
        _repository = repository,
        super(PopularStateLoading());

  @override
  Stream<PopularState> mapEventToState(PopularEvent event) async* {
    if (event == PopularEvent.LOAD) {
      yield* _mapToLoadState();
    } else if (event == PopularEvent.UPDATE) {
      yield* _mapToUpdateState();
    }
  }

  Stream<PopularState> _mapToLoadState() async* {
    __streamSubscription = _repository.getPopular().listen((event) {
      trainings = event;
      add(PopularEvent.UPDATE);
    });
  }

  Stream<PopularState> _mapToUpdateState() async* {
    yield PopularStateLoaded(trainings);
  }

  @override
  Future<void> close() {
    __streamSubscription?.cancel();
    return super.close();
  }
}

//state
abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularStateLoading extends PopularState {}

class PopularStateLoaded extends PopularState {
  final List<TrainingEntity> trainings;
  const PopularStateLoaded(this.trainings);

  @override
  List<Object> get props => [trainings];

  @override
  String toString() {
    return "T: ${trainings.length}";
  }
}

//event
enum PopularEvent { LOAD, UPDATE }
