import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryEntity {
  String id;
  String name;
  String icon;
  String cover;

  CategoryEntity({this.id, this.name, this.icon, this.cover});

  static CategoryEntity fromSnap(QueryDocumentSnapshot snap) {
    return CategoryEntity(
        id: snap.id,
        name: snap.data()['name'],
        icon: snap.data()['icon'],
        cover: snap.data()['cover']);
  }
}
