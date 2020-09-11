import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/repositories/vimeo_repository.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoPlayerController _playerController;
  String videoID;
  VideoBloc() : super(VideoStateIdle());

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event == VideoEvent.LOAD) {
      yield* _mapToLoad();
    } else if (event == VideoEvent.READY) {
      yield* _mapToReady();
    } else if (event == VideoEvent.PLAY_PAUSE) {
      yield* _mapToPP();
    } else if (event == VideoEvent.FFW) {
      yield* _mapToFFW();
    } else if (event == VideoEvent.RWD) {
      yield* _mapToRWD();
    }
  }

  Stream<VideoState> _mapToLoad() async* {
    yield VideoStateLoading();
    var data = await VimeoRepository.getVideo(videoID);
    _playerController = VideoPlayerController.network(
        data.files?.firstWhere((element) => element.width == 720)?.link ?? '')
      ..initialize().then((_) {
        add(VideoEvent.READY);
      });
  }

  Stream<VideoState> _mapToFFW() async* {
    if (_playerController.value.isPlaying) {
      final end = _playerController.value.duration.inMilliseconds;
      final skip = (_playerController.value.position + Duration(seconds: 15))
          .inMilliseconds;
      _playerController.seekTo(Duration(milliseconds: math.min(skip, end)));
    }
    yield VideoStateLoaded(_playerController);
  }

  Stream<VideoState> _mapToRWD() async* {
    final beginning = Duration(seconds: 0).inMilliseconds;
    final skip = (_playerController.value.position - Duration(seconds: 15))
        .inMilliseconds;
    _playerController.seekTo(Duration(milliseconds: math.max(skip, beginning)));

    yield VideoStateLoaded(_playerController);
  }

  Stream<VideoState> _mapToPP() async* {
    bool isFinished =
        _playerController.value.position >= _playerController.value.duration;
    if (_playerController.value.isPlaying) {
      _playerController.pause();
    } else {
      if (!_playerController.value.initialized) {
        _playerController.initialize().then((_) {
          _playerController.play();
        });
      } else {
        if (isFinished) {
          _playerController.seekTo(Duration(seconds: 0));
        }
        _playerController.play();
      }
    }
    yield VideoStateLoaded(_playerController);
  }

  Stream<VideoState> _mapToReady() async* {
    _playerController.play();
    yield VideoStateLoaded(_playerController);
  }

  @override
  Future<void> close() {
    _playerController?.dispose();
    return super.close();
  }
}

///states
abstract class VideoState {
  const VideoState();
}

class VideoStateIdle extends VideoState {}

class VideoStateLoading extends VideoState {}

class VideoStateLoaded extends VideoState {
  final VideoPlayerController playerController;

  const VideoStateLoaded(this.playerController);
}

class VideoStateError extends VideoState {}

///events
///basic interaction
enum VideoEvent { LOAD, READY, PLAY_PAUSE, STOP, FFW, RWD, FINISH, REFRESH }
