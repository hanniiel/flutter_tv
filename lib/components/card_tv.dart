import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

class CardTv extends StatelessWidget {
  final String cover, title;
  final bool isFocused;

  CardTv({
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/covers%2Fcard_cover_42.png?alt=media',
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
            border: Border.all(color: Colors.white, width: 0.5)),
        margin: EdgeInsets.all(10),
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                cover,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 40,
              width: double.infinity,
              color: Color(0xFF2F384B),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                textScaleFactor: 0.7,
                style: kTitleCardStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
