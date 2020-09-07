import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyEvent {
  static const int UP = 19;
  static const int DOWN = 20;
  static const int LEFT = 21;
  static const int RIGHT = 22;
  static const int CENTER = 23;
  static const int PLAY_PAUSE = 85;
}

void onKeyEvent(RawKeyEvent event, {Function enter, Function play}) {
  if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
    RawKeyDownEvent rawKeyDownEvent = event;
    RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data;
    print("keyCode: ${rawKeyEventDataAndroid.keyCode}");

    switch (rawKeyEventDataAndroid.keyCode) {
      case KeyEvent.UP: //KEY_UP
        break;
      case KeyEvent.DOWN: //KEY_DOWN
        //FocusScope.of(context).focusInDirection(TraversalDirection.down);
        break;
      case KeyEvent.LEFT: //KEY_LEFT
        //FocusScope.of(context).focusInDirection(TraversalDirection.left);
        break;
      case KeyEvent.RIGHT: //KEY_RIGHT
        //FocusScope.of(context).focusInDirection(TraversalDirection.right);
        break;
      case KeyEvent.CENTER: //KEY_CENTER
        enter?.call();
        break;
      case KeyEvent.PLAY_PAUSE: //PLAY/PAUSE
        play?.call();
        break;
      default:
        break;
    }
  }
}
