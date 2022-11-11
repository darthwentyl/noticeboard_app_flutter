import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/datas/callback_types.dart';
import 'package:noticeboard/datas/question.dart';
import 'package:noticeboard/layaout_elements/robot_verification/question_row.dart';
import 'package:noticeboard/layaout_elements/robot_verification/questions_chose_row.dart';
import 'package:noticeboard/utils/size_getter.dart';

class VerificationBox extends StatefulWidget {
  VerificationBox(this.questions, this.onVerify, {Key? key}) : super(key: key);

  List<Question> questions = [];
  BoolToVoidCallback onVerify;

  @override
  State<StatefulWidget> createState() =>
      _VerificationBoxState(questions, onVerify);
}

class _VerificationBoxState extends State<VerificationBox> {
  _VerificationBoxState(this._questions, this._onVerify);

  List<Question> _questions;
  BoolToVoidCallback _onVerify;

  int _curIdx = 0;
  bool _isVerified = true;

  @override
  void initState() {
    super.initState();
    _isVerified = true;
    _curIdx = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        height: SizeGetter.height(context, 50.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _title(),
              _question(),
              _choose(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        AppStrings.verificationTitle,
        style: TextStyle(
          color: AppColors.customBlue,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _question() {
    return QuestionRow(_questions[_curIdx].question);
  }

  _choose() {
    return QuestionsChoseRow(_questions, _curIdx, _onRefresh);
  }

  void _onRefresh(bool isPassed) {
    setState(() {
      if (_curIdx == _questions.length - 1) {
        _onVerify(_isVerified);
        return;
      }
      if (_curIdx < _questions.length - 1) {
        ++_curIdx;
        if (!isPassed) {
          _isVerified = false;
        }
      }
    });
  }
}
