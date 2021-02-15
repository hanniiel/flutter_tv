import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/training_entity.dart';

abstract class TrainingRepository {
  Stream<List<TrainingEntity>> getTrainings();
  Stream<List<TrainingEntity>> getPopular();
  Stream<List<TrainingEntity>> getNewest();
  Stream<TrainingEntity> getTrainingById(String id);
  Stream<List<TrainingEntity>> getTrainingsByQuery(Map<String, dynamic> query);
  //interactions
  Stream<int> getRating(String uid, String trainingId);
  Future<void> setRating(String uid, String trainingId, int score);
  Future<void> setViewsCount(String trainingId);
  //Future<void> setLatestView(String uid, String trainingId);
}

class TrainingFireStoreRepository extends TrainingRepository {
  static const _collection = 'trainings';
  final _reference = FirebaseFirestore.instance.collection(_collection);

  @override
  Stream<TrainingEntity> getTrainingById(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<TrainingEntity>> getTrainings() {
    return _reference.snapshots().map((event) => event.docs
        .map((e) => TrainingEntity.fromSnap(e))
        .toList()); //convert from entity to model
  }

  @override
  Stream<List<TrainingEntity>> getTrainingsByQuery(Map<String, dynamic> query) {
    Query q = _reference;
    //TODO implement query params & values
    query?.forEach((key, value) {
      switch (key) {
        case 'category':
          print(value);
          q = q.where(key, isEqualTo: value);
          break;
      }
    });

    return q.snapshots().map(
        (event) => event.docs.map((e) => TrainingEntity.fromSnap(e)).toList());
  }

  @override
  Stream<List<TrainingEntity>> getNewest() {
    return _reference
        .where('isNew', isEqualTo: true)
        .where('isActive', isEqualTo: true)
        .limit(10)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => TrainingEntity.fromSnap(e)).toList());
  }

  @override
  Stream<List<TrainingEntity>> getPopular() {
    return _reference
        .where('isNew', isEqualTo: true)
        .where('isActive', isEqualTo: true)
        .limit(5)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => TrainingEntity.fromSnap(e)).toList());
  }

  @override
  Stream<int> getRating(String uid, String trainingId) {
    // TODO: implement getRating
    throw UnimplementedError();
  }

  @override
  Future<void> setRating(String uid, String trainingId, int score) {
    // TODO: implement setRating
    throw UnimplementedError();
  }

  @override
  Future<void> setViewsCount(String trainingId) {
    // TODO: implement setViewsCount
    throw UnimplementedError();
  }
}
