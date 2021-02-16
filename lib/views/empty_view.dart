import 'package:flutter/material.dart';
import 'package:flutter_tv/constants/constants.dart';

class EmptyView extends StatelessWidget {
  static String id = 'emptyView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Por el momento no tienes clases reservadas.',
          textAlign: TextAlign.center,
          style: kTitleStartStyle.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}
