import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_movies.dart';
import 'package:flutter_tv/bloc/bloc_preview.dart';
import 'package:flutter_tv/components/core/card_movie.dart';
import 'package:flutter_tv/components/home_section.dart';

class SearchView extends StatelessWidget {
  final FocusNode fn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          TextField(
            focusNode: fn,
            decoration: const InputDecoration(
              filled: true,
              hintText: 'Enter your email',
              fillColor: Colors.white,
              focusColor: Colors.pink,
            ),
            onEditingComplete: () {
              fn.nextFocus();
            },
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
                          isProgram: true,
                          onFocus: (isFocused) {
                            BlocProvider.of<PreviewBloc>(context)
                                .add(PreviewEventLoad(training));
                          },
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchView()));
                            return;
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
        ],
      ),
    );
  }
}
