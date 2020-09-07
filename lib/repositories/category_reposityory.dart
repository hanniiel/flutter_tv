import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/category_entity.dart';

abstract class CategoryRepository {
  Stream<List<CategoryEntity>> getCategories();
}

class CategoryFireStoreRepository extends CategoryRepository {
  static const _collection = 'category';
  final _reference = FirebaseFirestore.instance.collection(_collection);

  @override
  Stream<List<CategoryEntity>> getCategories() {
    return _reference.snapshots().map(
        (event) => event.docs.map((e) => CategoryEntity.fromSnap(e)).toList());
  }
}
