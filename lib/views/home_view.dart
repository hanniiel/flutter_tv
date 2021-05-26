import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_movies.dart';
import 'package:flutter_tv/bloc/bloc_preview.dart';
import 'package:flutter_tv/components/core/card_movie.dart';
import 'package:flutter_tv/components/core/focus_base.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/detail_view.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homeView';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2;
    var width = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      endDrawerEnableOpenDragGesture: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: height,
              child: BlocBuilder<PreviewBloc, PreviewState>(
                builder: (_, state) {
                  if (state is PreviewStateLoaded) {
                    var movie = state.movieEntity;
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.network(
                              movie.cover,
                              width: width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            width: width,
                            height: height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  movie.titleCover,
                                  width: width / 2,
                                ),
                                SizedBox(height: 10),
                                Text(movie.description,
                                    style: kTitleDescriptions.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ))
                              ],
                            ),
                          ),
                        ))
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child:
                ListView(padding: EdgeInsets.only(left: 20), children: <Widget>[
              HomeSection(
                title: 'My List',
                section: BlocBuilder<MoviesBloc, MoviesState>(
                  // ignore: missing_return
                  builder: (_, state) {
                    // ignore: missing_return

                    if (state is MoviesStateLoaded) {
                      var trainings = state.movies;
                      return Container(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trainings.length,
                          itemBuilder: (context, index) {
                            var training = trainings[index];
                            return CardMovie(
                              isProgram: true,
                              onFocus: (isFocused) {
                                BlocProvider.of<PreviewBloc>(context)
                                    .add(PreviewEventLoad(training));
                              },
                              onPressed: () {
                                Navigator.pushNamed(context, DetailScreen.id,
                                    arguments: training);
                              },
                              title: training.title,
                              cover: training.cover,
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              HomeSection(
                title: 'My List',
                section: BlocBuilder<MoviesBloc, MoviesState>(
                  // ignore: missing_return
                  builder: (_, state) {
                    // ignore: missing_return

                    if (state is MoviesStateLoaded) {
                      var trainings = state.movies;
                      return Container(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trainings.length,
                          itemBuilder: (context, index) {
                            var training = trainings[index];
                            return CardMovie(
                              onFocus: (isFocused) {
                                BlocProvider.of<PreviewBloc>(context)
                                    .add(PreviewEventLoad(training));
                              },
                              onPressed: () {
                                Navigator.pushNamed(context, DetailScreen.id,
                                    arguments: training);
                              },
                              title: training.title,
                              cover: training.cover,
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
