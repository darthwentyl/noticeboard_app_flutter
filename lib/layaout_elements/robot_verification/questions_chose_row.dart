import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/datas/callback_types.dart';
import 'package:noticeboard/datas/question.dart';

class QuestionsChoseRow extends StatelessWidget {
  const QuestionsChoseRow(this._questions, this._idx, this._refreshCallback,
      {Key? key})
      : super(key: key);

  final List<Question> _questions;
  final int _idx;
  final BoolToVoidCallback _refreshCallback;

  @override
  Widget build(BuildContext context) {
    print('QuestionsChoseRow: _questions[_idx]: ${_questions[_idx]}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textButtonBackground,
                  padding: const EdgeInsets.all(8.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _refreshCallback(
                      ButtonStrings.yes == _questions[_idx].answer);
                },
                child: const Text(ButtonStrings.yes),
              ),
            ],
          ),
        ),
        Text(
          '${_idx + 1}/${_questions.length}',
          style: const TextStyle(
            color: AppColors.customBlue,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.textButtonBackground,
                  padding: const EdgeInsets.all(8.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  _refreshCallback(ButtonStrings.no == _questions[_idx].answer);
                },
                child: const Text(ButtonStrings.no),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
