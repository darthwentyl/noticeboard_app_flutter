import 'package:noticeboard/datas/widget_states.dart';

class WidgetStateController {
  EWidgetStates _state = EWidgetStates.posts;

  setState(EWidgetStates state) {
    print('states: $state');
    _state = state;
  }

  getState() {
    return _state;
  }
}
