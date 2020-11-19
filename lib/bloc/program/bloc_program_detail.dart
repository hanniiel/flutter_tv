import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/program/program_entity.dart';
import 'package:flutter_tv/models/program/routine_model.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';

class ProgramDBloc extends Bloc<ProgramDEvent, ProgramDState> {
  final TrainingRepository _trainingRepository;
  List<Routine> routines;

  ProgramDBloc({TrainingRepository trainingRepository})
      : assert(trainingRepository != null),
        _trainingRepository = trainingRepository,
        super(ProgramDStateUninitialized());

  @override
  Stream<ProgramDState> mapEventToState(ProgramDEvent event) async* {
    if (event is ProgramDEventSelect) {
      yield* _mapToLoad(event.program);
    }
  }

  Stream<ProgramDState> _mapToLoad(ProgramEntity program) async* {
    yield ProgramDStateLoading();
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
  final int selectedIndex;
  final List<TrainingEntity> trainings;

  const ProgramDStateLoaded(this.selectedIndex, this.trainings);

  @override
  List<Object> get props => [selectedIndex, trainings];
}

//events
abstract class ProgramDEvent {
  const ProgramDEvent();
}

class ProgramDEventSelect extends ProgramDEvent {
  final ProgramEntity program;

  const ProgramDEventSelect(this.program);
}
