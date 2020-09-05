import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TrainingEntity {
  String id;
  String name;
  String iName;
  String description;
  String category;
  int duration;
  int calories;
  String difficulty;
  String cover;
  String coverFull;
  List equipment;
  List bloques;
  List<dynamic> series;
  DocumentReference trainer;
  bool active;
  String videoId;

  static TrainingEntity fromSnap(QueryDocumentSnapshot snapshot) {
    return TrainingEntity(
      id: snapshot.id,
      name: snapshot.data()['name'],
      iName: snapshot.data()['iName'],
      description: snapshot.data()['desc'],
      duration: snapshot.data()['duration'],
      calories: snapshot.data()['calories'],
      difficulty: snapshot.data()['difficulty'],
      cover: snapshot.data()['cover'],
      coverFull: snapshot.data()['coverFull'],
      trainer: snapshot.data()['trainer'],
      equipment: snapshot.data()['equipment'],
      active: snapshot.data()['isActive'],
      category: snapshot.data()['category'],
      videoId: snapshot.data()['video'],
      series: snapshot.data()['series'],
      bloques: snapshot.data()['bloques'],
    );
  }

  TrainingEntity(
      {Key key,
      @required this.id,
      @required this.bloques,
      @required this.series,
      @required this.name,
      @required this.iName,
      @required this.description,
      @required this.duration,
      @required this.difficulty,
      @required this.cover,
      @required this.coverFull,
      @required this.calories,
      @required this.equipment,
      @required this.active,
      @required this.category,
      @required this.videoId,
      this.trainer});
}
