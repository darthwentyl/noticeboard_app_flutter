import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/posts_widget.dart';

class WidgetStateController {
  WidgetStateController(Key key) {
    _stateWidgetMap = {EWidgetStates.posts: PostsWidget(key: key)};
  }
  EWidgetStates _state = EWidgetStates.posts;

  late final Map<EWidgetStates, Widget> _stateWidgetMap;

  setState(EWidgetStates state) {
    print('states: $state');
    _state = state;
  }

  getState() {
    return _state;
  }

  getWidget() {
    return _state == EWidgetStates.posts
        ? _stateWidgetMap[_state]
        : const Text('State will be added',
            style: TextStyle(fontSize: 16.0, color: Colors.red));
  }
}
