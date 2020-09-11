import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_video.dart';
import 'package:flutter_tv/bloc/bloc_video_controls.dart';
import 'package:flutter_tv/utils/KeyEventHandler.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  static String id = 'videoView';
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<VideoBloc, VideoState>(
        listener: (_, state) {
          if (state is VideoStateLoaded) {
            //BlocProvider.of<ControlsBloc>(context).add(ControlsEvent.SHOW);
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
                Positioned(
                  bottom: 0,
                  child: BlocBuilder<ControlsBloc, ControlsState>(
                      // ignore: missing_return
                      builder: (context, state) {
                    return AnimatedOpacity(
                      opacity: state is ControlsStateInvisible ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        color: Colors.white38,
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: FocusScope(
                          autofocus: true,
                          onKey:
                              BlocProvider.of<ControlsBloc>(context).onKeyEvent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 30,
                                focusColor: Colors.grey.withOpacity(0.5),
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
                    );
                  }),
                )
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
