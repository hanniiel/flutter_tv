import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/models/movie_entity.dart';

class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  PreviewBloc() : super(PreviewStateUninitialized());

  @override
  Stream<PreviewState> mapEventToState(PreviewEvent event) async* {
    if (event is PreviewEventLoad) {
      yield* _mapToLoad(event.movieEntity);
    }
  }

  Stream<PreviewState> _mapToLoad(MovieEntity movie) async* {
    yield PreviewStateLoaded(movie);
  }
}

///states
abstract class PreviewState {
  const PreviewState();
}

class PreviewStateUninitialized extends PreviewState {}

class PreviewStateLoading extends PreviewState {}

class PreviewStateLoaded extends PreviewState {
  final MovieEntity movieEntity;
  const PreviewStateLoaded(this.movieEntity);
}

///events
abstract class PreviewEvent {
  const PreviewEvent();
}

class PreviewEventLoad extends PreviewEvent {
  final MovieEntity movieEntity;
  const PreviewEventLoad(this.movieEntity);
}
