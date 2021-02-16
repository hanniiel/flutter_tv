import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/program/bloc_program_detail.dart';
import 'package:flutter_tv/components/card_program_tv.dart';
import 'package:flutter_tv/components/core/focus_base.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/program/program_entity.dart';
import 'package:flutter_tv/repositories/training_repository.dart';
import 'package:flutter_tv/utils/UrlImage.dart';

import 'detail_view.dart';

mixin Cards {
  List<FocusScopeNode> elements;
}

class ProgramDetailScreen extends StatelessWidget implements Cards {
  @override
  List<FocusScopeNode> elements;

  static String id = 'programDetailScreen';

  FocusScopeNode selection = FocusScopeNode();

  FocusScopeNode list = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    final ProgramEntity program = ModalRoute.of(context).settings.arguments;
    List<String> trainingIds = [];

    for (var i = 0; i < program.routine.length; i++) {
      for (var j = 0; j < program.routine[i]['exercises'].length; j++) {
        trainingIds.add(program.routine[i]['exercises'][j]);
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height / 3),
                child: Ink.image(
                  fit: BoxFit.cover,
                  image: NetworkImage(UrlImage.getUrl(program.cover)),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      program.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: kTitleScrollBarStyle.copyWith(
                          fontSize: 25, height: 1.5),
                    ),
                    SizedBox(height: 10),
                    Text(
                      program.description,
                      textAlign: TextAlign.justify,
                      style: kDescriptionScroll.copyWith(fontSize: 23),
                    ),
                  ],
                ),
              ),
              /*FocusScope(
                autofocus: true,
                node: selection,
                onKey: (f, k) {
                  if (k is RawKeyDownEvent &&
                      k.logicalKey == LogicalKeyboardKey.arrowDown) {
                    print('requestibg asd');
                    list.requestFocus();
                  }
                  return false;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Color(0xFF2D2D2D),
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        autofocus: true,
                        focusColor: Colors.black,
                        child: Text(
                          'SEMANA 1',
                          style: kTitleMenuStyle,
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        focusColor: Colors.black,
                        child: Text(
                          'SEMANA 2',
                          style: kTitleMenuStyle,
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        focusColor: Colors.black,
                        child: Text(
                          'SEMANA 3',
                          style: kTitleMenuStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
              SizedBox(height: 20),
              BlocProvider(
                create: (context) => ProgramDBloc(
                    trainingIds: trainingIds,
                    trainingRepository:
                        context.repository<TrainingFireStoreRepository>())
                  ..add(ProgramDEvent.LOAD),
                child: Container(
                    height: 300,
                    padding: EdgeInsets.all(10),
                    child: FocusScope(
                      node: list,
                      onKey: (f, k) {
                        if (k is RawKeyDownEvent &&
                            k.logicalKey == LogicalKeyboardKey.arrowUp) {
                          selection.requestFocus();
                        }
                        return false;
                      },
                      child: BlocBuilder<ProgramDBloc, ProgramDState>(
                        builder: (_, state) {
                          if (state is ProgramDStateLoaded) {
                            return ListView.builder(
                              itemCount: state.trainings.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                var training = state.trainings[index];

                                return CardProgramTv(
                                  title: training.name,
                                  cover: UrlImage.getUrl(training.cover),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, DetailScreen.id,
                                        arguments: training);
                                  },
                                  onFocus: (isFocused) {},
                                );
                              },
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
