import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_overlay.dart';
import 'package:flutter_tv/bloc/bloc_video.dart';
import 'package:flutter_tv/bloc/bloc_video_controls.dart';
import 'package:flutter_tv/components/bloque_widget.dart';
import 'package:flutter_tv/components/caption_widget.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/utils/captions_helper.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_tv/utils/format_time.dart';

class VideoScreen extends StatelessWidget {
  final TrainingEntity training;
  static String id = 'videoView';

  VideoScreen(this.training);

  @override
  Widget build(BuildContext context) {
    CaptionsHelper.setCaptions(training);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<VideoBloc, VideoState>(
        listener: (context, state) {
          if (state is VideoStateLoaded) {
            BlocProvider.of<OverlayBloc>(context)
                .add(OverlayEventLoad(state.playerController));
          }
        },
        // ignore: missing_return
        builder: (_, state) {
          if (state is VideoStateLoaded) {
            var playerController = state.playerController;
            return Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: playerController.value.aspectRatio,
                    child: VideoPlayer(playerController),
                  ),
                ),

                ///optional : custom captions remove if not required & CaptionHelper methods
                BlocBuilder<OverlayBloc, OverlayStates>(
                  builder: (_, state) {
                    if (state is OverlayStateUpdate) {
                      var lastValue = state.lastValue;
                      var caption =
                          CaptionsHelper.getCaption(lastValue.position);
                      var header = CaptionsHelper.getHeader(lastValue.position);
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          header != null
                              ? Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: BloqueWidget(
                                        header: header,
                                        headers: CaptionsHelper.headers),
                                  ),
                                )
                              : Container(),
                          caption != null
                              ? Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CaptionProgressWidget(
                                      title: caption.subtitle.title,
                                      description: caption.subtitle.desc,
                                      progress: caption.elapsed.inMicroseconds /
                                          caption.total.inMicroseconds,
                                      remaining:
                                          formatDuration(caption.remaining),
                                      alignment: EdgeInsets.only(
                                          left: 30, right: 30, bottom: 20),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    }
                    return Container();
                  },
                ),

                /// video controls
                Positioned.fill(
                  child: BlocBuilder<ControlsBloc, ControlsState>(
                      // ignore: missing_return
                      builder: (context, state) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          child: AnimatedOpacity(
                            opacity:
                                state is ControlsStateInvisible ? 0.0 : 1.0,
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedOpacity(
                            opacity:
                                state is ControlsStateInvisible ? 0.0 : 1.0,
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              color: Colors.black,
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: FocusScope(
                                autofocus: true,
                                onKey: BlocProvider.of<ControlsBloc>(context)
                                    .onKeyEvent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      iconSize: 30,
                                      focusColor: Colors.white,
                                      color: Colors.white,
                                      onPressed: () {
                                        BlocProvider.of<VideoBloc>(context)
                                            .add(VideoEvent.RWD);
                                      },
                                      icon: Icon(
                                        Icons.fast_rewind,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 40,
                                      focusColor: Colors.grey.withOpacity(0.5),
                                      color: Colors.white,
                                      onPressed: () {
                                        BlocProvider.of<VideoBloc>(context)
                                            .add(VideoEvent.PLAY_PAUSE);
                                      },
                                      icon: Icon(
                                        playerController.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      focusColor: Colors.grey.withOpacity(0.5),
                                      color: Colors.white,
                                      onPressed: () {
                                        BlocProvider.of<VideoBloc>(context)
                                            .add(VideoEvent.FFW);
                                      },
                                      icon: Icon(
                                        Icons.fast_forward,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ));
          }
        },
      ),
    );
  }
}
