import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_categories.dart';
import 'package:flutter_tv/bloc/bloc_newest.dart';
import 'package:flutter_tv/bloc/bloc_popular.dart';
import 'package:flutter_tv/components/card_category_tv.dart';
import 'package:flutter_tv/components/card_tv.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/utils/KeyEventHandler.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/category_view.dart';
import 'package:flutter_tv/views/detail_view.dart';
import 'package:flutter_tv/views/video_view.dart';

class Person {
  final String name;
  bool isSelected;
  Person(this.name, this.isSelected);
}

class HomeScreen extends StatefulWidget {
  static String id = 'homeView';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list2 = [
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
  ];

  var list3 = [
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
  ];

  var list4 = [
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
    Person("", false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
          padding: EdgeInsets.only(top: 100, left: 20),
          children: <Widget>[
            HomeSection(
              title: 'LO MÀS NUEVO',
              section: BlocBuilder<NewestBloc, NewestState>(
                // ignore: missing_return
                builder: (_, state) {
                  // ignore: missing_return

                  if (state is NewestStateLoaded) {
                    var trainings = state.trainings;
                    return Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: trainings.length,
                        itemBuilder: (context, index) {
                          var training = trainings[index];
                          return FocusWidget(
                            customWidget: CardTv(
                              isFocused: false,
                              title: training.name,
                              cover: UrlImage.getUrl(training.cover),
                            ),
                            event: (event) {
                              onKeyEvent(event, enter: () {
                                //navigate to details card
                                Navigator.pushNamed(context, DetailScreen.id,
                                    arguments: training);
                              });
                            },
                            hasFocus: (hasFocus) {
                              setState(() {
                                //focusedItem.isSelected = hasFocus;
                              });
                            },
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
                            return FocusWidget(
                              customWidget: CardCategoryTv(
                                cover: UrlImage.getUrl(category.cover),
                                icon: category.icon,
                                title: category.name,
                              ),
                              event: (event) {
                                onKeyEvent(event, enter: () {
                                  //navigate to selected category
                                  Navigator.pushNamed(
                                      context, CategoryScreen.id,
                                      arguments: category);
                                });
                              },
                              hasFocus: (hasFocus) {
                                setState(() {
                                  //focusedItem.isSelected = hasFocus;
                                });
                              },
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
                          return FocusWidget(
                            customWidget: CardTv(
                              isFocused: false,
                              title: training.name,
                              cover: UrlImage.getUrl(training.cover),
                            ),
                            event: (event) {
                              onKeyEvent(event, enter: () {
                                //navigate to details card
                                Navigator.pushNamed(context, DetailScreen.id,
                                    arguments: training);
                                print('n ${training.name}');
                              });
                            },
                            hasFocus: (hasFocus) {
                              setState(() {
                                //focusedItem.isSelected = hasFocus;
                              });
                            },
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
    );
  }
}
