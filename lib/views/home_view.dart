import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_categories.dart';
import 'package:flutter_tv/bloc/bloc_newest.dart';
import 'package:flutter_tv/bloc/bloc_popular.dart';
import 'package:flutter_tv/bloc/program/bloc_programs.dart';
import 'package:flutter_tv/components/card_category_tv.dart';
import 'package:flutter_tv/components/card_program_tv.dart';
import 'package:flutter_tv/components/focus_text.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/models/initializer.dart' as initializer;
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/category_view.dart';
import 'package:flutter_tv/views/detail_view.dart';
import 'package:flutter_tv/views/program_detail.dart';
import 'package:flutter_tv/utils/string_extension.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homeView';
  final cats = initializer.cats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'assets/icon.jpg',
          width: 30,
        ),
        actions: [
          FocusTextWidget(
            title: 'INICIO',
            onPressed: () {},
            onFocus: (hasFocus) {},
          ),
          FocusTextWidget(
            title: 'FAVORITOS',
            onPressed: () {},
            onFocus: (hasFocus) {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/avatars%2FOval.jpg?alt=media'),
            ),
          ),
        ],
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          children: <Widget>[
            HomeSection(
              title: 'CLASES 1-1 EN VIVO',
              section: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    focusColor: Colors.white10,
                    onPressed: () {},
                    child: Container(
                      height: 150,
                      child: Ink.image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/avatars%2F1-1%20banner.jpg?alt=media'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            HomeSection(
              title: 'PROGRAMAS',
              section: BlocBuilder<ProgramsBloc, ProgramsState>(
                // ignore: missing_return
                builder: (_, state) {
                  // ignore: missing_return

                  if (state is ProgramsStateLoaded) {
                    var programs = state.programs;

                    return Container(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: programs.length,
                        itemBuilder: (context, index) {
                          var program = programs[index];

                          return CardProgramTv(
                            isProgram: true,
                            onFocus: (isFocused) {},
                            coverText: UrlImage.getUrl(program.coverText),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ProgramDetailScreen.id,
                                  arguments: program);
                            },
                            category: program.duration.toUpperCase(),
                            title: program.title,
                            cover: UrlImage.getUrl(program.cover),
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
              title: 'CATEGORÍAS',
              section: BlocBuilder<CategoriesBloc, CategoryState>(
                // ignore: missing_return
                builder: (_, state) {
                  if (state is CategoryStateLoaded) {
                    var categories = state.categories;
                    return Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            var category = categories[index];
                            return CardCategoryTv(
                              cover: UrlImage.getUrl(category.cover),
                              icon: category.icon,
                              title: category.name,
                              onPressed: () {
                                Navigator.pushNamed(context, CategoryScreen.id,
                                    arguments: category);
                              },
                              onFocus: (hasFocus) {},
                            );
                          }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            HomeSection(
              title: 'POPULARES',
              section: BlocBuilder<PopularBloc, PopularState>(
                // ignore: missing_return
                builder: (_, state) {
                  // ignore: missing_return
                  if (state is PopularStateLoaded) {
                    var trainings = state.trainings;
                    return Container(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trainings.length,
                          itemBuilder: (context, index) {
                            var training = trainings[index];

                            return CardProgramTv(
                              onFocus: (isFocused) {},
                              onPressed: () {
                                Navigator.pushNamed(context, DetailScreen.id,
                                    arguments: training);
                              },
                              title: training.name,
                              category: cats
                                  .singleWhere((element) =>
                                      element.id == training.category)
                                  .name
                                  .toUpperCase(),
                              cover: UrlImage.getUrl(training.cover),
                            );
                          },
                        ));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ]),
    );
  }
}
