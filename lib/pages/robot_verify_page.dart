import 'package:flutter/cupertino.dart';
import 'package:noticeboard/parsers/robot_verify_questions_parser.dart';
import 'package:noticeboard/widgets/robot_verify_layout.dart';

class RobotVerifyPage extends StatefulWidget {
  const RobotVerifyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyPageState();
}

class _RobotVerifyPageState extends State<RobotVerifyPage> {
  final RobotVerifyQuestionsParser _parser = RobotVerifyQuestionsParser();

  @override
  Widget build(BuildContext context) {
    return const RobotVerifyLayout();
  }
}
