import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

//
class RoundedButtonGradient extends StatelessWidget {
  //
  final VoidCallback onPress;
  final String text;
  final TextStyle style;
  final List<Color> colors;
  final double height;
  final EdgeInsetsGeometry marginGeometry;
  final bool isActive;

  RoundedButtonGradient({
    Key key,
    @required this.text,
    @required this.onPress,
    this.style = kTitleClaseStyle,
    this.colors = defaultGradient,
    this.marginGeometry,
    this.height = 49.0,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginGeometry,
      height: height,
      child: Center(
        child: Opacity(
          opacity: isActive ? 1 : 0.5,
          child: RaisedButton(
            onPressed: isActive ? this.onPress : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints: BoxConstraints(minWidth: 250, minHeight: 49.0),
                alignment: Alignment.center,
                child: Text(
                  this.text,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedButtonOutline extends StatelessWidget {
  //
  final VoidCallback onPress;
  final String text;
  final TextStyle style;
  final List<Color> colors;
  final double height;
  final EdgeInsetsGeometry marginGeometry;
  final bool isActive;

  RoundedButtonOutline({
    Key key,
    @required this.text,
    @required this.onPress,
    this.style = kTitleClaseStyle,
    this.colors = defaultGradient,
    this.marginGeometry,
    this.height = 49.0,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginGeometry,
      height: height,
      child: Center(
        child: Opacity(
          opacity: isActive ? 1 : 0.5,
          child: RaisedButton(
            splashColor: Colors.grey.withOpacity(0.2),
            color: Colors.black.withOpacity(0.9),
            onPressed: isActive ? this.onPress : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                )),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              child: Container(
                constraints: BoxConstraints(minWidth: 250, minHeight: 49.0),
                alignment: Alignment.center,
                child: Text(
                  this.text,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
