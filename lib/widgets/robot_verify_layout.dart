import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/parsers/robot_verify_questions_parser.dart';

class RobotVerifyLayout extends StatefulWidget {
  const RobotVerifyLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyLayoutState();
}

class _RobotVerifyLayoutState extends State<RobotVerifyLayout> {
  List<String> _questions = [];

  @override
  void initState() {
    super.initState();
    final RobotVerifyQuestionsParser parser = RobotVerifyQuestionsParser();
    _questions = parser.getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return _questions.isEmpty
        ? _showQuestionsIsEmptySnackBar()
        : const Text("TBD");
  }

  Widget backButton() {
    return TextButton(
      child: const Text(AppStrings.back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  _showQuestionsIsEmptySnackBar() {
    return AlertDialog(
      title: const Text(ErrStrings.errStr),
      content: const Text(ErrStrings.emptyQuestionsList),
      actions: [
        backButton(),
      ],
    );
  }
}
