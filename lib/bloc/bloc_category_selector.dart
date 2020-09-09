import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/category_entity.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';

class CategorySelectorBloc extends Bloc<CatSelectorEvent, CatSelectorState> {
  TrainingRepository _repository;
  StreamSubscription _subscription;
  List<TrainingEntity> _trainings;
  CategorySelectorBloc(TrainingRepository repository)
      : assert(repository != null),
        _repository = repository,
        super(CatSelectorStateUnselected());

  @override
  Stream<CatSelectorState> mapEventToState(CatSelectorEvent event) async* {
    if (event is CatSelectorEventSelect) {
      yield* _mapToSelect(event.category);
    } else if (event is CatSelectorEventUpdate) {
      yield* _mapToUpdate();
    } else if (event is CatSelectorChangeFocus) {
      yield* _mapToFocusChanged(event.training);
    }
  }

  Stream<CatSelectorState> _mapToSelect(CategoryEntity category) async* {
    yield CatSelectorStateLoading();
    _subscription?.cancel();
    _subscription = _repository
        .getTrainingsByQuery({'category': category.id}).listen((event) {
      _trainings = event;
      add(CatSelectorEventUpdate());
    });
  }

  Stream<CatSelectorState> _mapToUpdate() async* {
    yield CatSelectorStateSelected(_trainings);
  }

  Stream<CatSelectorState> _mapToFocusChanged(TrainingEntity training) async* {
    //_trainings = [];
    if (state is CatSelectorStateSelected) {
      print(" focus: ${training.isFocused}");

      _trainings = [];
      _trainings = (state as CatSelectorStateSelected)
          .trainings
          .map((e) => e.id == training.id ? training : e)
          .toList();
      yield CatSelectorStateSelected(_trainings);
      //add(CatSelectorEventUpdate());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

///states
abstract class CatSelectorState extends Equatable {
  const CatSelectorState();
  //

  //
  @override
  List<Object> get props => [];
}

class CatSelectorStateUnselected extends CatSelectorState {}

class CatSelectorStateLoading extends CatSelectorState {}

class CatSelectorStateSelected extends CatSelectorState {
  //consult all order by cat
  final List<TrainingEntity> trainings;
  const CatSelectorStateSelected([this.trainings = const []]);
  //
  @override
  List<Object> get props => [this.trainings];
}

///events
abstract class CatSelectorEvent extends Equatable {
  const CatSelectorEvent();

  @override
  List<Object> get props => [];
}

class CatSelectorEventSelect extends CatSelectorEvent {
  final CategoryEntity category;
  const CatSelectorEventSelect(this.category);

  @override
  List<Object> get props => [this.category];
}

class CatSelectorEventUpdate extends CatSelectorEvent {}

class CatSelectorChangeFocus extends CatSelectorEvent {
  final TrainingEntity training;
  const CatSelectorChangeFocus(this.training);

  @override
  List<Object> get props => [this.training];
}
