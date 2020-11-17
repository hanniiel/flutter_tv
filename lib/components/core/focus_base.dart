import 'package:flutter/material.dart';
import 'package:flutter_tv/components/card_tv.dart';
import 'package:flutter_tv/constants/constants.dart';

class FocusBaseWidget extends StatefulWidget {
  final String title, cover;
  final Function onPressed;
  final Function(bool) onFocus;

  FocusBaseWidget({
    this.title,
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/covers%2Fcard_cover_42.png?alt=media',
    this.onPressed,
    this.onFocus,
  });

  @override
  _FocusBaseWidgetState createState() => _FocusBaseWidgetState();
}

class _FocusBaseWidgetState extends State<FocusBaseWidget> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        widget.onFocus?.call(focusNode.hasFocus);
      });
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(() {});
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: focusNode.hasFocus ? 1.0 : 0.9,
      child: RawMaterialButton(
        onPressed: widget.onPressed,
        focusNode: focusNode,
        fillColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5)),
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Ink.image(
                  image: NetworkImage(widget.cover),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: focusNode.hasFocus ? 80 : 40,
                width: double.infinity,
                color:
                    focusNode.hasFocus ? Color(0xFF4EBEFF) : Color(0xFF2F384B),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: focusNode.hasFocus ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        textScaleFactor: 0.7,
                        style: kTitleCardStyle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
