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
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        focusNode: focusNode,
        onPressed: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            border: Border.all(
                width: focusNode.hasFocus ? 1 : 0, color: Color(0xFF4EBEFF)),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: NetworkImage(widget.cover),
                ),
              ),
              Container(
                color: Colors.black38,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.title.toUpperCase(),
                      textScaleFactor: 1,
                      style: kTitleCardStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 80,
                      child: VerticalDivider(
                        width: 10,
                        color: Colors.white,
                        thickness: 5,
                      ),
                    )
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
