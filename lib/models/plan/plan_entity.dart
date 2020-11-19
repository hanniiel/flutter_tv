import 'package:cloud_firestore/cloud_firestore.dart';

class PlanFitnessEntity {
  final String id;
  final String idProgram;
  final List<String> exercisesDone;
  bool isCompleted;

  PlanFitnessEntity(
      {this.id, this.idProgram, this.exercisesDone, this.isCompleted});

  static PlanFitnessEntity fromSnap(DocumentSnapshot snapshot) {
    return PlanFitnessEntity(
      id: snapshot.id,
      idProgram: snapshot.data()['program_id'],
      exercisesDone: List<String>.from(snapshot.data()['exercises_completed']),
      isCompleted: snapshot.data()['is_completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercises_completed': this.exercisesDone,
      'is_completed': this.isCompleted,
    };
  }
}
