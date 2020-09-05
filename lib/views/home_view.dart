import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_newest.dart';
import 'package:flutter_tv/components/card_tv.dart';
import 'package:flutter_tv/components/focus_widget.dart';
import 'package:flutter_tv/components/home_section.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/utils/UrlImage.dart';
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
  void _onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
      RawKeyDownEvent rawKeyDownEvent = event;
      RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data;
      print("keyCode: ${rawKeyEventDataAndroid.keyCode}");

      switch (rawKeyEventDataAndroid.keyCode) {
        case 19: //KEY_UP
          break;
        case 20: //KEY_DOWN
          //FocusScope.of(context).focusInDirection(TraversalDirection.down);
          break;
        case 21: //KEY_LEFT
          //FocusScope.of(context).focusInDirection(TraversalDirection.left);
          break;
        case 22: //KEY_RIGHT
          //FocusScope.of(context).focusInDirection(TraversalDirection.right);
          break;
        case 23: //KEY_CENTER
          Navigator.pushNamed(context, VideoScreen.id);
          break;
        case 85: //PLAY/PAUSE
          break;
        default:
          break;
      }
    }
  }

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
                            event: _onKeyEvent,
                            hasFocus: (hasFocus) {
                              setState(() {
                                //focusedItem.isSelected = hasFocus;
                              });
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            HomeSection(
              title: 'LO MÀS NUEVO 2',
              section: Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list3.length,
                      itemBuilder: (context, index) {
                        var focusedItem = list3[index];
                        return FocusWidget(
                          customWidget: Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 200,
                            color: focusedItem.isSelected
                                ? Colors.grey
                                : Colors.black,
                            child: Center(
                              child: Text(
                                "$index",
                                style: kTitleCardStyle,
                              ),
                            ),
                          ),
                          event: _onKeyEvent,
                          hasFocus: (hasFocus) {
                            setState(() {
                              focusedItem.isSelected = hasFocus;
                            });
                          },
                        );
                      })),
            ),
            HomeSection(
              title: 'LO MÀS NUEVO 3',
              section: Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list4.length,
                      itemBuilder: (context, index) {
                        var focusedItem = list4[index];
                        return FocusWidget(
                          customWidget: Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            width: 200,
                            color: focusedItem.isSelected
                                ? Colors.grey
                                : Colors.black,
                            child: Center(
                              child: Text(
                                "$index",
                                style: kTitleCardStyle,
                              ),
                            ),
                          ),
                          event: _onKeyEvent,
                          hasFocus: (hasFocus) {
                            setState(() {
                              focusedItem.isSelected = hasFocus;
                            });
                          },
                        );
                      })),
            ),
          ]),
    );
  }
}
