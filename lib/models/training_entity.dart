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
  List equipment;
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
      name: snapshot.get('name'),
      iName: snapshot.get('iName'),
      description: snapshot.get('desc'),
      duration: snapshot.get('duration'),
      calories: snapshot.get('calories'),
      difficulty: snapshot.get('difficulty'),
      cover: snapshot.get('cover'),
      coverFull: snapshot.get('coverFull'),
      trainer: snapshot.get('trainer'),
      equipment: snapshot.get('equipment'),
      active: snapshot.get('isActive'),
      category: snapshot.get('category'),
      videoId: snapshot.get('video'),
      series: snapshot.get('series'),
      bloques: snapshot.get('bloques'),
      isNew: snapshot.get('isNew'),
      isPopular: snapshot.get('isPopular'),
      isPro: snapshot.get('isPro'),
      body: snapshot.get('body'),
      type: snapshot.get('type'),
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
