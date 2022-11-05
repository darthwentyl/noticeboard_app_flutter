import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/controllers/robot_verify_questions_controller.dart';
import 'package:noticeboard/datas/question.dart';
import 'package:noticeboard/layaout_elements/verification_box.dart';

class RobotVerifyLayout extends StatefulWidget {
  const RobotVerifyLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyLayoutState();
}

class _RobotVerifyLayoutState extends State<RobotVerifyLayout> {
  List<Question> _questions = [];
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    var controller = RobotVerifyQuestionsController();
    controller.getQuestions().then((value) {
      setState(() {
        _questions = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questions.isEmpty
        ? _showQuestionsIsEmptySnackBar()
        : VerificationBox(isVerified: _isVerified, questions: _questions);
  }

  Widget backButton() {
    return TextButton(
      child: const Text(ButtonStrings.back),
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
