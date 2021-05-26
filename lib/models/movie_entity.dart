import 'package:cloud_firestore/cloud_firestore.dart';

class MovieEntity {
  final String title;
  final String description;
  final String category;
  final String videoId;
  final String cover;
  final String titleCover;

  MovieEntity({
    this.title,
    this.description,
    this.category,
    this.cover,
    this.videoId,
    this.titleCover,
  });

  factory MovieEntity.fromSnap(DocumentSnapshot snapshot) {
    return MovieEntity(
      title: snapshot.get('title'),
      description: snapshot.get('description'),
      category: snapshot.get('category'),
      videoId: snapshot.get('video_id'),
      cover: snapshot.get('cover'),
      titleCover: snapshot.get('title_cover'),
    );
  }
}
