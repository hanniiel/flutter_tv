import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_category_selector.dart';
import 'package:flutter_tv/components/card_tv.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/models/category_entity.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/utils/KeyEventHandler.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'detail_view.dart';

class CategoryScreen extends StatelessWidget {
  static String id = 'catFilterView';

  @override
  Widget build(BuildContext context) {
    final CategoryEntity category = ModalRoute.of(context).settings.arguments;
    BlocProvider.of<CategorySelectorBloc>(context)
        .add(CatSelectorEventSelect(category));
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('cat filter'),
        ),
        body: BlocBuilder<CategorySelectorBloc, CatSelectorState>(
          // ignore: missing_return
          builder: (_, state) {
            if (state is CatSelectorStateSelected) {
              var trainings = state.trainings;
              //handle this on bloc
              Map<String, List<TrainingEntity>> lista = {};
              for (var i in trainings) {
                if (i.body != null) {
                  if (lista[i.body] == null) {
                    lista[i.body] = [];
                    lista[i.body].add(i);
                  } else {
                    lista[i.body].add(i);
                  }
                }
              }

              return ListView.builder(
                padding: EdgeInsets.only(top: 100, left: 20),
                itemCount: lista.keys.length,
                // ignore: missing_return
                itemBuilder: (_, index) {
                  var key = lista.keys.elementAt(index);
                  var ts = lista[key];
                  return HomeSection(
                    title: key.toUpperCase(),
                    section: Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ts.length,
                        itemBuilder: (context, index) {
                          var training = ts[index];
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
                              BlocProvider.of<CategorySelectorBloc>(context)
                                  .add(CatSelectorChangeFocus(
                                      training.copyWith(isFocused: hasFocus)));
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
