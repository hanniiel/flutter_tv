import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tv/constants/constants.dart';
import 'package:platform_svg/platform_svg.dart';

class FocusTextWidget extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Function(bool) onFocus;

  FocusTextWidget({
    @required this.title,
    this.onFocus,
    this.onPressed,
  });

  @override
  _FocusTextWidgetState createState() => _FocusTextWidgetState();
}

class _FocusTextWidgetState extends State<FocusTextWidget> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        widget.onFocus?.call(_focusNode.hasFocus);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      focusNode: _focusNode,
      onPressed: widget.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            textScaleFactor: 1,
            style: kTitleHomeMenu.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 24,
              height: 1,
            ),
          ),
          _focusNode.hasFocus ? SizedBox(height: 5) : Container(),
          _focusNode.hasFocus
              ? PlatformSvg.asset('assets/icons/line.svg', width: 50)
              : Container()
        ],
      ),
    );
  }
}
