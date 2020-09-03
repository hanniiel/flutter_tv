import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/second_screen.dart';
import 'components/focus_widget.dart';
import 'components/home_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
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
      backgroundColor: Colors.white.withOpacity(0.2),
      body: ListView(padding: EdgeInsets.only(top: 20), children: <Widget>[
        HomeSection(
          title: 'LO MÀS NUEVO 1',
          section: Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list2.length,
                  itemBuilder: (context, index) {
                    var focusedItem = list2[index];
                    return FocusWidget(
                      customWidget: Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 200,
                        color:
                            focusedItem.isSelected ? Colors.grey : Colors.black,
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
                        color:
                            focusedItem.isSelected ? Colors.grey : Colors.black,
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
                        color:
                            focusedItem.isSelected ? Colors.grey : Colors.black,
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

class Person {
  final String name;
  bool isSelected;
  Person(this.name, this.isSelected);
}
