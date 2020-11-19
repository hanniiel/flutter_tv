import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_coaches.dart';
import 'package:flutter_tv/bloc/bloc_equipment.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/utils/KeyEventHandler.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/video_view.dart';
import 'package:platform_svg/platform_svg.dart';
import 'package:flutter_tv/utils/string_extension.dart';

class DetailScreen extends StatelessWidget {
  static String id = 'detailView';

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final TrainingEntity training = ModalRoute.of(context).settings.arguments;
    final orientation = MediaQuery.of(context).orientation;

    var equipment = BlocProvider.of<EquipmentBloc>(context).equipmentList;
    var coaches = BlocProvider.of<CoachesBloc>(context).coachesList;

    var trainer =
        coaches.singleWhere((element) => element.id == training.trainer.id);

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            PlatformSvg.asset('assets/icons/time.svg',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              '${training.duration} min',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            PlatformSvg.asset('assets/icons/difficulty.svg',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              '${training.difficulty.capitalize()}',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            PlatformSvg.asset('assets/icons/fire.svg',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              '${training.calories} Cal',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ],
    );
    var equipments = training.equipment.map((e) {
      var equip = equipment.singleWhere((el) => el.id == e);
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PlatformSvg.asset('assets/icons/${equip.icon}',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              '${equip.name.capitalize()}',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      );
    }).toList();

    column.children.addAll(equipments ?? []);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: h / 3,
        flexibleSpace: Image.network(
          UrlImage.getUrl(training.coverFull),
          fit: orientation == Orientation.landscape
              ? BoxFit.contain
              : BoxFit.cover,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            color: Color(0xFF2D2D2D),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, VideoScreen.id,
                        arguments: training);
                  },
                  focusColor: Colors.black,
                  child: Text(
                    'REPRODUCIR',
                    style: kTitleMenuStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  focusColor: Colors.black,
                  child: Text(
                    'HABILITAR OFFLINE',
                    style: kTitleMenuStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  column,
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 350,
                        child: Text(
                          training.name,
                          style: kDescriptionHome.copyWith(
                            fontSize: 20,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(UrlImage.getUrl(trainer.avatar)),
                        ),
                        SizedBox(width: 10),
                        Text(
                          trainer.name,
                          style: kTitleCardStyle.copyWith(fontSize: 15),
                        ),
                        Container(
                          width: 50,
                          height: 15,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          training.difficulty.capitalize(),
                          style: kTitleCardStyle.copyWith(fontSize: 15),
                        ),
                      ]),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 350,
                        child: Text(
                          training.description,
                          style: kDescriptionScroll,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
