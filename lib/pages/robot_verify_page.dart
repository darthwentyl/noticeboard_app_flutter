import 'package:flutter/cupertino.dart';
import 'package:noticeboard/layouts//robot_verify_layout.dart';

class RobotVerifyPage extends StatefulWidget {
  const RobotVerifyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyPageState();
}

class _RobotVerifyPageState extends State<RobotVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return const RobotVerifyLayout();
  }
}
