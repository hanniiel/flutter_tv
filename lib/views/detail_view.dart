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

class DetailScreen extends StatefulWidget {
  static String id = 'detailView';
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.5),
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                      UrlImage.getUrl(training.cover),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FocusWidget(
                        event: (e) {
                          onKeyEvent(e, enter: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoScreen()));
                          });
                        },
                        customWidget: MaterialButton(
                          onPressed: () {},
                          color: Colors.grey,
                          child: Text(
                            'REPRODUCIR',
                            style: kTitleDescriptions,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        training.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: kTitleScrollBarStyle.copyWith(fontSize: 30),
                      ),
                      Text(
                        training.description,
                        textAlign: TextAlign.justify,
                        style: kDescriptionScroll.copyWith(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
