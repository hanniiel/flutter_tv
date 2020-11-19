import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/program/program_cat_entity.dart';
import 'package:flutter_tv/models/program/program_entity.dart';

abstract class ProgramRepository {
  Future<ProgramCatEntity> getCategoryById(String catId);
  Stream<List<ProgramCatEntity>> getCategories();
  Future<List<ProgramEntity>> getProgramsByCatId(String catId);
  Future<ProgramEntity> getProgramById(String programId);
}

class ProgramFireRepository extends ProgramRepository {
  final categories = FirebaseFirestore.instance.collection('plan_categories');
  final programs = FirebaseFirestore.instance.collection('plan_fitness');

  @override
  Future<ProgramCatEntity> getCategoryById(String catId) async {
    var result = await categories.doc(catId).get();
    return result.exists ? ProgramCatEntity.fromSnap(result) : null;
  }

  @override
  Stream<List<ProgramCatEntity>> getCategories() {
    return categories.snapshots().map((event) =>
        event.docs.map((e) => ProgramCatEntity.fromSnap(e)).toList());
  }

  @override
  Future<List<ProgramEntity>> getProgramsByCatId(String catId) async {
    var result = await programs.where('category', isEqualTo: catId).get();
    return result?.docs?.map((e) => ProgramEntity.fromSnap(e))?.toList() ?? [];
  }

  @override
  Future<ProgramEntity> getProgramById(String programId) async {
    var result = await programs.doc(programId).get();
    return result.exists
        ? ProgramEntity.fromSnap(result)
        : null; //get default program not assigned
  }
}
