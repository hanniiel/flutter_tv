import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/equipment/equipment_entity.dart';
import 'package:flutter_tv/repositories/equipment_repository.dart';

class EquipmentBloc extends Bloc<EquipmentEvent, EquipmentState> {
  final EquipmentRepository _equipmentRepository;
  StreamSubscription _streamSubscription;

  List<EquipmentEntity> equipmentList = [];

  EquipmentBloc(EquipmentRepository equipmentRepository)
      : assert(equipmentRepository != null),
        _equipmentRepository = equipmentRepository,
        super(EquipmentState.UNINITIALIZED);

  @override
  Stream<EquipmentState> mapEventToState(EquipmentEvent event) async* {
    switch (event) {
      case EquipmentEvent.LOAD:
        yield* _mapToLoad();
        break;
      case EquipmentEvent.UPDATE:
        yield* _mapToUpdate();
        break;
    }
  }

  Stream<EquipmentState> _mapToLoad() async* {
    yield EquipmentState.LOADING;

    _streamSubscription?.cancel();
    _streamSubscription = _equipmentRepository.getAll().listen((event) {
      equipmentList = event;
      add(EquipmentEvent.UPDATE);
    });
  }

  Stream<EquipmentState> _mapToUpdate() async* {
    yield EquipmentState.LOADED;
  }
}

//states
enum EquipmentState { UNINITIALIZED, LOADING, LOADED }
//events
enum EquipmentEvent { LOAD, UPDATE }
