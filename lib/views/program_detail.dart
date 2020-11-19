import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv/components/card_program_tv.dart';
import 'package:flutter_tv/components/core/focus_base.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:flutter_tv/models/program/program_entity.dart';
import 'package:flutter_tv/utils/UrlImage.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FocusScope(
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
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        focusColor: Colors.white,
                        color: Color(0xFF2F384B),
                        child: Text(
                          'SEMANA 1',
                          style: kTitleDescriptions,
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        focusColor: Colors.white,
                        color: Color(0xFF2F384B),
                        child: Text(
                          'SEMANA 2',
                          style: kTitleDescriptions,
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {},
                        focusColor: Colors.white,
                        color: Color(0xFF2F384B),
                        child: Text(
                          'SEMANA 3',
                          style: kTitleDescriptions,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return CardProgramTv(
                        title: 'some title $index',
                        onPressed: () {},
                        onFocus: (isFocused) {},
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
