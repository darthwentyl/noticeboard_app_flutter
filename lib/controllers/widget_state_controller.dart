import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/posts_widget.dart';

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
    return _stateWidgetMap[_state] ??
        const Text('State will be added',
            style: TextStyle(fontSize: 16.0, color: Colors.red));
  }

  registerWidget(EWidgetStates state, Widget widget) {
    _stateWidgetMap[state] = widget;
  }
}
