import 'package:flutter/material.dart';

class FocusWidget extends StatefulWidget {
  final Widget customWidget;
  final Function(bool hasFocus) hasFocus;
  final Function(RawKeyEvent event) event;

  FocusWidget({
    @required this.customWidget,
    @required this.event,
    @required this.hasFocus,
  });

  @override
  _FocusWidgetState createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  final FocusNode fn = FocusNode();

  @override
  void initState() {
    super.initState();
    fn.addListener(() {
      widget.hasFocus?.call(fn.hasFocus);
    });
  }

  @override
  void dispose() {
    fn.removeListener(() {});
    fn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: fn,
      onKey: (event) {
        widget.event?.call(event);
      },
      child: widget.customWidget,
    );
  }
}
