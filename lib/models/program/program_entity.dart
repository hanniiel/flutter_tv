import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramEntity {
  final String id;
  final String title;
  final String description;
  final String category;
  final String duration;
  final String cover;
  //
  List<dynamic> routine;

  ProgramEntity({
    this.id,
    this.description,
    this.title,
    this.category,
    this.duration,
    this.cover,
    this.routine,
  });

  static ProgramEntity fromSnap(DocumentSnapshot snapshot) {
    return ProgramEntity(
      id: snapshot.id,
      title: snapshot.data()['name'],
      category: snapshot.data()['category'],
      description: snapshot.data()['description'],
      duration: snapshot.data()['weeks'],
      cover: snapshot.data()['cover'],
      routine: snapshot.data()['exercises'],
    );
  }
}
