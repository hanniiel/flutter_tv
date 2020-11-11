import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/utils/KeyEventHandler.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
import 'package:flutter_tv/views/video_view.dart';

class DetailScreen extends StatelessWidget {
  static String id = 'detailView';

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final TrainingEntity training = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: h / 3,
        flexibleSpace: Image.network(
          UrlImage.getUrl(training.coverFull),
          fit: BoxFit.contain,
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, VideoScreen.id,
                          arguments: training);
                    },
                    autofocus: true,
                    color: Colors.grey,
                    child: Text(
                      'REPRODUCIR',
                      style: kTitleDescriptions,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    training.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: kTitleScrollBarStyle.copyWith(
                        fontSize: 25, height: 1.5),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      training.description,
                      textAlign: TextAlign.justify,
                      style: kDescriptionScroll.copyWith(fontSize: 23),
                    ),
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
