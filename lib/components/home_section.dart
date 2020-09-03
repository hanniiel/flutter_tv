import 'package:flutter/material.dart';
import 'package:flutter_tv/constants/constants.dart';

class HomeSection extends StatelessWidget {
  final Widget section;
  final String title;
  final bool isHeader;

  HomeSection({
    this.section,
    this.title,
    this.isHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 39),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 23, bottom: 17),
            child: Text(
              title,
              style: isHeader
                  ? kTitleHomeMenu
                  : kTitleHomeMenu.copyWith(fontSize: 20),
            ),
          ),
          section
        ],
      ),
    );
  }
}
