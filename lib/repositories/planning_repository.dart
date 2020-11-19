import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/plan/plan_entity.dart';

abstract class PlanningRepository {
  Future<void> updateFitnessPlan(String uid, PlanFitnessEntity planFitness);
  Stream<PlanFitnessEntity> getPlan(String uid);
  Future<void> createFitnessProgram(String uid, String programID,
      {bool isDefault = false});
}

class PlanningFireRepository extends PlanningRepository {
  final _reference = FirebaseFirestore.instance.collection('plan_user_fitness');
  @override
  Stream<PlanFitnessEntity> getPlan(String uid) {
    return _reference.doc(uid).snapshots().map(
        (event) => event.exists ? PlanFitnessEntity.fromSnap(event) : null);
  }

  @override
  Future<void> createFitnessProgram(String uid, String programID,
      {bool isDefault = false}) async {
    _reference.doc(uid).set({
      'exercises_completed': [],
      'is_completed': false,
      'program_id': isDefault ? '47uGGi1kKpbGjGDHM49d' : programID,
    });
  }

  @override
  Future<void> updateFitnessPlan(
      String uid, PlanFitnessEntity planFitness) async {
    await _reference.doc(uid).update(planFitness.toJson());
  }
}
