import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  String id;
  String name;
  String icon;
  String cover;
  bool isFocused;

  CategoryEntity(
      {this.id, this.name, this.icon, this.cover, this.isFocused = false});

  CategoryEntity copyWith({bool isFocused}) {
    return CategoryEntity(
        id: id, name: name, icon: icon, cover: cover, isFocused: isFocused);
  }

  static CategoryEntity fromSnap(QueryDocumentSnapshot snap) {
    return CategoryEntity(
        id: snap.id,
        name: snap.data()['name'],
        icon: snap.data()['icon'],
        cover: snap.data()['cover']);
  }

  @override
  List<Object> get props => [this.id, this.isFocused];
}
