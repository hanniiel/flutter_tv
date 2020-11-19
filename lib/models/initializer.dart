import 'dart:async';

import 'package:flutter_tv/models/category_entity.dart';
import 'package:flutter_tv/models/program/program_cat_entity.dart';
import 'package:flutter_tv/repositories/category_reposityory.dart';
import 'package:flutter_tv/repositories/program_repository.dart';

List<ProgramCatEntity> programCats = [];
List<CategoryEntity> cats = [];

class Initializer {
  final _programFireRepository = ProgramFireRepository();
  final _catsRepository = CategoryFireStoreRepository();
  //
  Completer _taskProgramCats = Completer();
  Completer _taskCats = Completer();

  Future<void> init() async {
    _initProgramCats();
    _initCats();
    await Future.wait([_taskProgramCats.future, _taskCats.future]);
  }

  Future<void> _initProgramCats() async {
    return _programFireRepository.getCategories().listen((event) {
      print("times initialized");
      programCats = event;
      _taskProgramCats.complete();
    });
  }

  Future<void> _initCats() async {
    return _catsRepository.getCategories().listen((event) {
      print("times cats initialized");
      cats = event;
      _taskCats.complete();
    });
  }
}
