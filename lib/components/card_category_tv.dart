import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

class CardCategoryTv extends StatelessWidget {
  final String cover, title, icon;
  final bool isFocused;

  CardCategoryTv({
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/categories%2Fbarre.png?alt=media',
    this.icon = '',
    this.title,
    this.isFocused = false,
  });
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isFocused ? 1.0 : 0.9,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: NetworkImage(cover), fit: BoxFit.fill)),
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              textScaleFactor: 1,
              style: kTitleCardStyle,
            )
          ],
        ),
      ),
    );
  }
}
