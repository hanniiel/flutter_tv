import 'package:cloud_firestore/cloud_firestore.dart';

class CoachEntity {
  final String id;
  final String avatar;
  final String name;

  CoachEntity({this.id, this.name, this.avatar});

  factory CoachEntity.fromSnap(DocumentSnapshot snapshot) => CoachEntity(
        id: snapshot.id,
        name: snapshot.data()['name'],
        avatar: snapshot.data()['avatar'],
      );
}
