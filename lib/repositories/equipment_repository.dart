import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/equipment/equipment_entity.dart';

abstract class EquipmentRepository {
  Stream<List<EquipmentEntity>> getAll();
}

class EquipmentFireRepository extends EquipmentRepository {
  final _collection = FirebaseFirestore.instance.collection('equipment');

  @override
  Stream<List<EquipmentEntity>> getAll() {
    return _collection.snapshots().map(
        (event) => event.docs.map((e) => EquipmentEntity.fromSnap(e)).toList());
  }
}
