import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

class CardCategoryTv extends StatefulWidget {
  final String cover, title, icon;
  final Function onPressed;
  final Function(bool) onFocus;

  CardCategoryTv({
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/categories%2Fbarre.png?alt=media',
    this.icon = '',
    this.title,
    this.onFocus,
    this.onPressed,
  });

  @override
  _CardCategoryTvState createState() => _CardCategoryTvState();
}

class _CardCategoryTvState extends State<CardCategoryTv> {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        focusNode: focusNode,
        onPressed: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(widget.cover), fit: BoxFit.fill)),
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title.toUpperCase(),
                textScaleFactor: 1,
                style: kTitleCardStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
