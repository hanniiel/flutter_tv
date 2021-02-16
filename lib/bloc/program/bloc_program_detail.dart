import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/program/program_entity.dart';
import 'package:flutter_tv/models/program/routine_model.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';

class ProgramDBloc extends Bloc<ProgramDEvent, ProgramDState> {
  final TrainingRepository _trainingRepository;
  List<Routine> routines;
  List<String> _trainingIds = [];
  List<TrainingEntity> _trainings = [];

  ProgramDBloc(
      {List<String> trainingIds, TrainingRepository trainingRepository})
      : assert(trainingRepository != null),
        _trainingRepository = trainingRepository,
        assert(trainingIds != null),
        _trainingIds = trainingIds,
        super(ProgramDStateUninitialized());

  @override
  Stream<ProgramDState> mapEventToState(ProgramDEvent event) async* {
    if (event == ProgramDEvent.LOAD) {
      yield* _mapToLoad();
    }
  }

  Stream<ProgramDState> _mapToLoad() async* {
    _trainings?.clear();
    yield ProgramDStateLoading();
    try {
      for (var i = 0; i < _trainingIds.length; i++) {
        var training =
            await _trainingRepository.getTrainingById(_trainingIds[i]);
        _trainings.add(training);
      }
      yield ProgramDStateLoaded(_trainings);
    } catch (e) {
      print(e);
    }
  }
}

//states
abstract class ProgramDState extends Equatable {
  const ProgramDState();

  @override
  List<Object> get props => [];
}

class ProgramDStateUninitialized extends ProgramDState {}

class ProgramDStateLoading extends ProgramDState {}

class ProgramDStateLoaded extends ProgramDState {
  final List<TrainingEntity> trainings;

  const ProgramDStateLoaded(this.trainings);

  @override
  List<Object> get props => [trainings];
}

//events
enum ProgramDEvent { LOAD, UPDATE }
