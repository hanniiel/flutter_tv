import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tv/models/movie_entity.dart';

abstract class MovieRepository {
  Stream<List<MovieEntity>> getMovies();
}

class MovieFireRepository extends MovieRepository {
  final String collection = 'movies';

  @override
  Stream<List<MovieEntity>> getMovies() {
    return FirebaseFirestore.instance.collection(collection).snapshots().map(
        (event) => event.docs.map((e) => MovieEntity.fromSnap(e)).toList());
  }
}
