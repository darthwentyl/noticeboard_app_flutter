import 'package:flutter/material.dart';
import 'package:noticeboard/datas/widget_states.dart';

class WidgetStateController {
  EWidgetStates _state = EWidgetStates.posts;

  final Map<EWidgetStates, Widget> _stateWidgetMap = {};

  setState(EWidgetStates state) {
    print('states: $state');
    _state = state;
  }

  getState() {
    return _state;
  }

  getWidget() {
    print("getWidget(): _state: $_state");
    return _stateWidgetMap[_state] ??
        Text('State $_state will be added',
            style: TextStyle(fontSize: 16.0, color: Colors.red));
  }

  registerWidget(EWidgetStates state, Widget widget) {
    _stateWidgetMap[state] = widget;
  }
}
