import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/program/program_entity.dart';
import 'package:flutter_tv/repositories/program_repository.dart';

class ProgramsBloc extends Bloc<ProgramsEvent, ProgramsState> {
  final ProgramRepository _programRepository;
  StreamSubscription _streamSubscription;
  List<ProgramEntity> _programs = [];

  ProgramsBloc(ProgramRepository programRepository)
      : assert(programRepository != null),
        _programRepository = programRepository,
        super(ProgramsStateUninitialized());

  @override
  Stream<ProgramsState> mapEventToState(ProgramsEvent event) async* {
    if (event == ProgramsEvent.LOAD) {
      yield* _mapToLoad();
    } else if (event == ProgramsEvent.UPDATE) {
      yield* _mapToUpdate();
    }
  }

  Stream<ProgramsState> _mapToLoad() async* {
    yield ProgramsStateLoading();

    _streamSubscription?.cancel();
    _streamSubscription = _programRepository.getProgramAll().listen((event) {
      _programs = event;
      add(ProgramsEvent.UPDATE);
    });
  }

  Stream<ProgramsState> _mapToUpdate() async* {
    yield ProgramsStateLoaded(_programs);
  }
}

//states
abstract class ProgramsState extends Equatable {
  const ProgramsState();

  @override
  List<Object> get props => [];
}

class ProgramsStateUninitialized extends ProgramsState {}

class ProgramsStateLoading extends ProgramsState {}

class ProgramsStateLoaded extends ProgramsState {
  final List<ProgramEntity> programs;

  const ProgramsStateLoaded(this.programs);

  @override
  List<Object> get props => [programs];
}

//events
enum ProgramsEvent { LOAD, UPDATE }
