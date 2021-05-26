import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/movie_entity.dart';
import 'package:flutter_tv/repositories/movie_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository _repository;
  StreamSubscription __streamSubscription;
  List<MovieEntity> movies = [];

  MoviesBloc(MovieRepository repository)
      : assert(repository != null),
        _repository = repository,
        super(NMoviesStateLoading());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event == MoviesEvent.LOAD) {
      yield* _mapToLoadState();
    } else if (event == MoviesEvent.UPDATED) {
      yield* _mapToUpdateState();
    }
  }

  Stream<MoviesState> _mapToLoadState() async* {
    __streamSubscription = _repository.getMovies().listen((event) {
      movies = event;
      add(MoviesEvent.UPDATED);
    });
  }

  Stream<MoviesState> _mapToUpdateState() async* {
    yield MoviesStateLoaded(movies);
  }

  @override
  Future<void> close() {
    __streamSubscription?.cancel();
    return super.close();
  }
}

///states
abstract class MoviesState extends Equatable {
  const MoviesState();
  @override
  List<Object> get props => [];
}

class NMoviesStateLoading extends MoviesState {}

class MoviesStateLoaded extends MoviesState {
  final List<MovieEntity> movies;
  const MoviesStateLoaded(this.movies);

  @override
  List<Object> get props => [movies];

  @override
  String toString() {
    return "T: ${movies.length}";
  }
}

///events
enum MoviesEvent { LOAD, UPDATED }
