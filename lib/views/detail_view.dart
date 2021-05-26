import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/movie_entity.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/video_view.dart';
import 'package:platform_svg/platform_svg.dart';

class DetailScreen extends StatelessWidget {
  static String id = 'detailView';

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final MovieEntity movie = ModalRoute.of(context).settings.arguments;
    final orientation = MediaQuery.of(context).orientation;

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            PlatformSvg.asset('assets/icons/time.svg',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              '15 min',
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
              '${movie.category}',
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
              '10 Cal',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ],
    );

    column.children.addAll([
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PlatformSvg.asset('assets/icons/mancuernas.svg',
                color: Colors.white, width: 20),
            SizedBox(width: 10),
            Text(
              'mancuernas',
              style: kTitleCardStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      )
    ]);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: h / 3,
        flexibleSpace: Image.network(
          movie.cover,
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
                        arguments: movie);
                  },
                  autofocus: true,
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
                          movie.title,
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
                          backgroundImage: NetworkImage(UrlImage.getUrl('')),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'entrenador',
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
                          movie.category,
                          style: kTitleCardStyle.copyWith(fontSize: 15),
                        ),
                      ]),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 350,
                        child: Text(
                          movie.description,
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
