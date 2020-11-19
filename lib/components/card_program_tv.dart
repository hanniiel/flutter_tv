import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

class CardProgramTv extends StatefulWidget {
  final String title, category, cover;
  final Function onPressed;
  final Function(bool) onFocus;
  final bool isProgram;

  CardProgramTv({
    this.title,
    this.isProgram = false,
    this.category = 'Fuerza',
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/covers%2Fcard_cover_42.png?alt=media',
    this.onPressed,
    this.onFocus,
  });

  @override
  _CardProgramTvState createState() => _CardProgramTvState();
}

class _CardProgramTvState extends State<CardProgramTv> {
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
          child: Stack(
            children: [
              Column(
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
                    color: focusNode.hasFocus
                        ? Color(0xFF4EBEFF)
                        : Color(0xFF2F384B),
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
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.center,
                    color: widget.isProgram ? Colors.white : Color(0xFF50BCFF),
                    height: 35,
                    width: 150,
                    child: Text(
                      widget.category,
                      textAlign: TextAlign.center,
                      style: kTitleMenuStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              widget.isProgram ? Colors.black : Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
