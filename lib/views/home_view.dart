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
import 'package:flutter_tv/views/program_detail.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'homeView';

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
                              isFocused: training.isFocused,
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
                              BlocProvider.of<NewestBloc>(context).add(
                                  NewestEventFocusChanged(
                                      training.copyWith(isFocused: hasFocus)));
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
                                isFocused: category.isFocused,
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
                                BlocProvider.of<CategoriesBloc>(context).add(
                                    CategoryEventFocusChanged(category.copyWith(
                                        isFocused: hasFocus)));
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
                              isFocused: training.isFocused,
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
                              BlocProvider.of<PopularBloc>(context).add(
                                  PopularEventFocusChanged(
                                      training.copyWith(isFocused: hasFocus)));
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
