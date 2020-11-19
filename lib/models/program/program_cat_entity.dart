import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/program/program_entity.dart';

class ProgramCatEntity {
  final String id;
  final String description;
  final String icon;
  final String name;
  List<ProgramEntity> programs;

  ProgramCatEntity({
    this.id,
    this.name,
    this.description,
    this.icon,
    this.programs,
  });

  static ProgramCatEntity fromSnap(DocumentSnapshot snapshot) {
    return new ProgramCatEntity(
      id: snapshot.id,
      description: snapshot.data()['description'],
      name: snapshot.data()['name'],
      icon: snapshot.data()['icon'],
      programs: [],
    );
  }
}
