import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_category_selector.dart';
import 'package:flutter_tv/components/card_tv.dart';
import 'package:flutter_tv/components/core/focus_base.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/models/category_entity.dart';
import 'package:flutter_tv/models/descriptions.dart';
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
          title: Text(category.name.toUpperCase()),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
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
                    title: descriptions[key].toUpperCase(),
                    section: Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ts.length,
                        itemBuilder: (context, index) {
                          var training = ts[index];

                          return FocusBaseWidget(
                            onFocus: (isFocused) {},
                            onPressed: () {
                              Navigator.pushNamed(context, DetailScreen.id,
                                  arguments: training);
                            },
                            title: training.name,
                            cover: UrlImage.getUrl(training.cover),
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
