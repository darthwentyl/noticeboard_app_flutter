import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/controllers/robot_verify_questions_controller.dart';
import 'package:noticeboard/datas/question.dart';
import 'package:noticeboard/layaout_elements/robot_verification/verification_box.dart';
import 'package:noticeboard/pages/main_posts_table_page.dart';

class RobotVerifyLayout extends StatefulWidget {
  const RobotVerifyLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RobotVerifyLayoutState();
}

class _RobotVerifyLayoutState extends State<RobotVerifyLayout> {
  final _numOfQuestions = 3;

  List<Question> _questions = [];
  bool _isVerified = true;

  @override
  void initState() {
    super.initState();
    var controller = RobotVerifyQuestionsController(_numOfQuestions);
    controller.getQuestions().then((value) {
      setState(() {
        _questions = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create loading page
    return _questions.isEmpty
        ? _showQuestionsIsEmptySnackBar()
        : _isVerified
            ? VerificationBox(_questions, _onVerify)
            : _showVerifiedFailedSnackBar();
  }

  _backButton() {
    return TextButton(
      child: const Text(ButtonStrings.back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  _nextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPostsTablePage(),
        fullscreenDialog: true,
      ),
    );
  }

  _showQuestionsIsEmptySnackBar() {
    return AlertDialog(
      title: const Text(ErrStrings.errStr),
      content: const Text(ErrStrings.emptyQuestionsList),
      actions: [
        _backButton(),
      ],
    );
  }

  _showVerifiedFailedSnackBar() {
    return AlertDialog(
      title: const Text(ErrStrings.errStr),
      content: const Text(ErrStrings.robotVerifyFailed),
      actions: [
        _backButton(),
      ],
    );
  }

  _onVerify(bool isVerified) {
    print('_RobotVerifyLayoutState: isVerified: $isVerified');
    if (!isVerified) {
      setState(() {
        _isVerified = false;
      });
    } else {
      _nextPage();
    }
  }
}
