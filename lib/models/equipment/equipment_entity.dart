import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentEntity {
  final String id;
  final String name;
  final String icon;

  EquipmentEntity({this.id, this.name, this.icon});

  factory EquipmentEntity.fromSnap(DocumentSnapshot snapshot) {
    return EquipmentEntity(
      id: snapshot.id,
      name: snapshot.data()['name'],
      icon: snapshot.data()['icon'],
    );
  }
}
