import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/constants/constants.dart';

class CardMovie extends StatefulWidget {
  final String title, category, cover, coverText;
  final Function onPressed;
  final Function(bool) onFocus;
  final bool isProgram;

  CardMovie({
    this.title,
    this.isProgram = false,
    this.category = 'Fuerza',
    this.cover =
        'https://firebasestorage.googleapis.com/v0/b/fitflow-87a22.appspot.com/o/covers%2Fcard_cover_42.png?alt=media',
    this.coverText,
    this.onPressed,
    this.onFocus,
  });

  @override
  _CardProgramTvState createState() => _CardProgramTvState();
}

class _CardProgramTvState extends State<CardMovie> {
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
      padding: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.isProgram ? 10 : 0),
        child: RawMaterialButton(
          onPressed: widget.onPressed,
          focusNode: focusNode,
          fillColor: Colors.black,
          child: AnimatedContainer(
            width: widget.isProgram ? 150 : 350,
            duration: Duration(milliseconds: 500),
            transform: !focusNode.hasFocus
                ? (Matrix4.identity()..scale(0.99, 0.99))
                : Matrix4.identity(),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              border: Border.all(
                  color: focusNode.hasFocus
                      ? widget.isProgram
                          ? Colors.white
                          : Colors.white.withOpacity(0.5)
                      : Colors.white.withOpacity(0.5),
                  width: 1),
              borderRadius: BorderRadius.circular(widget.isProgram ? 10 : 0),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ///bg
                Positioned.fill(
                  child: Ink.image(
                    image: NetworkImage(widget.cover),
                    fit: BoxFit.cover,
                  ),
                ),

                ///cover text
                if (widget.coverText != null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 120,
                        child: Image.network(widget.coverText),
                      ),
                    ),
                  ),

                if (!widget.isProgram)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
