import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TrainingEntity extends Equatable {
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
  List<String> equipment;
  List bloques;
  List<dynamic> series;
  DocumentReference trainer;
  bool isNew;
  bool isPopular;
  bool isPro;
  String type;
  String body;
  bool active;
  String videoId;
  //
  bool isFocused;

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
      equipment: List<String>.from(snapshot.data()['equipment']),
      active: snapshot.data()['isActive'],
      category: snapshot.data()['category'],
      videoId: snapshot.data()['video'],
      series: snapshot.data()['series'],
      bloques: snapshot.data()['bloques'],
      isNew: snapshot.data()['isNew'],
      isPopular: snapshot.data()['isPopular'],
      isPro: snapshot.data()['isPro'],
      body: snapshot.data()['body'],
      type: snapshot.data()['type'],
    );
  }

  TrainingEntity copyWith({bool isFocused}) {
    return TrainingEntity(
      isFocused: isFocused,
      id: id,
      name: name,
      iName: iName,
      description: description,
      duration: duration,
      calories: calories,
      difficulty: difficulty,
      cover: cover,
      active: active,
      coverFull: coverFull,
      trainer: trainer,
      equipment: equipment,
      category: category,
      videoId: videoId,
      series: series,
      bloques: bloques,
      isNew: isNew,
      isPopular: isPopular,
      isPro: isPro,
      body: body,
      type: type,
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
      this.isFocused = false,
      this.isNew,
      this.isPopular,
      this.isPro,
      this.body,
      this.type,
      this.trainer});

  @override
  List<Object> get props => [id, isFocused];
}
