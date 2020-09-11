import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class OverlayBloc extends Bloc<OverlayEvent, OverlayStates> {
  VideoPlayerController _playerController;
  VideoPlayerValue _lastValue;
  Duration _remaining;

  OverlayBloc() : super(OverlayStateIdle());

  @override
  Stream<OverlayStates> mapEventToState(OverlayEvent event) async* {
    if (event is OverlayEventLoad) {
      yield* _mapToLoad(event.controller);
    } else if (event is OverlayEventUpdate) {
      yield* _mapToUpdate();
    }
  }

  Stream<OverlayStates> _mapToLoad(VideoPlayerController player) async* {
    _playerController = player;
    _playerController.addListener(() {
      if (_playerController.value.isPlaying) {
        _lastValue = _playerController.value;
        add(OverlayEventUpdate(_lastValue));
      }
    });
  }

  Stream<OverlayStates> _mapToUpdate() async* {
    yield OverlayStateUpdate(_lastValue);
  }

  @override
  Future<void> close() {
    _playerController?.removeListener(() {});
    return super.close();
  }
}

///states
abstract class OverlayStates {
  const OverlayStates();
}

class OverlayStateIdle extends OverlayStates {}

class OverlayStateUpdate extends OverlayStates {
  final VideoPlayerValue lastValue;
  const OverlayStateUpdate(this.lastValue);
}

///events
abstract class OverlayEvent {
  const OverlayEvent();
}

class OverlayEventIdle extends OverlayEvent {}

class OverlayEventLoad extends OverlayEvent {
  final VideoPlayerController controller;
  const OverlayEventLoad(this.controller);
}

class OverlayEventUpdate extends OverlayEvent {
  final VideoPlayerValue lastValue;
  const OverlayEventUpdate(this.lastValue);
}
