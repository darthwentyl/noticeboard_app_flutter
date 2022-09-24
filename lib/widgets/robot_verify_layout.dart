import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/controllers/robot_verify_questions_controller.dart';
import 'package:noticeboard/datas/verify_questions.dart';

class RobotVerifyLayout extends StatefulWidget {
  const RobotVerifyLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyLayoutState();
}

class _RobotVerifyLayoutState extends State<RobotVerifyLayout> {
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    var controller = RobotVerifyQuestionsController();
    _questions = controller.getQuestions();
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
