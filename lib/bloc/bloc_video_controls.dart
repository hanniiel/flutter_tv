import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlsBloc extends Bloc<ControlsEvent, ControlsState> {
  Timer _hideTimer;
  FocusNode currentSelection;

  ControlsBloc() : super(ControlsStateInvisible());

  @override
  Stream<ControlsState> mapEventToState(ControlsEvent event) async* {
    if (event == ControlsEvent.HIDE) {
      yield* _mapToInvisible();
    } else if (event == ControlsEvent.SHOW) {
      yield* _mapToVisible();
    } else if (event == ControlsEvent.CANCEL) {
      yield* _mapToCancel();
    }
  }

  Stream<ControlsState> _mapToCancel() async* {
    _hideTimer?.cancel();
    yield* _mapToVisible();
  }

  Stream<ControlsState> _mapToVisible() async* {
    yield ControlsStateVisible();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      add(ControlsEvent.HIDE);
    });
  }

  Stream<ControlsState> _mapToInvisible() async* {
    currentSelection?.traversalChildren
        ?.firstWhere((e) => e.hasFocus, orElse: () => null)
        ?.unfocus();
    yield ControlsStateInvisible();
  }

  ///Handle control input events
  bool onKeyEvent(FocusNode f, RawKeyEvent e) {
    if (e is RawKeyDownEvent) {
      if (state is ControlsStateVisible) {
        add(ControlsEvent.CANCEL);
      } else if (state is ControlsStateInvisible) {
        add(ControlsEvent.SHOW);
      }
      if (e.logicalKey == LogicalKeyboardKey.select &&
          state is ControlsStateInvisible) {
        f.traversalChildren.toList()[1].requestFocus();
      }
      currentSelection = f;
    }

    return false;
  }
}

abstract class ControlsState {
  const ControlsState();
}

class ControlsStateVisible extends ControlsState {}

class ControlsStateInvisible extends ControlsState {}

///events
enum ControlsEvent { HIDE, CANCEL, SHOW }
