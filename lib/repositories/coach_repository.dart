import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/coach/coach_entity.dart';

abstract class CoachRepository {
  Stream<List<CoachEntity>> getAll();
}

class CoachFireRepository extends CoachRepository {
  final _collection = FirebaseFirestore.instance.collection('trainers');

  @override
  Stream<List<CoachEntity>> getAll() {
    return _collection.snapshots().map(
        (event) => event.docs.map((e) => CoachEntity.fromSnap(e)).toList());
  }
}
