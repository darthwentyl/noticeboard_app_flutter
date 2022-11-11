import 'package:flutter/cupertino.dart';
import 'package:noticeboard/const/app_colors.dart';

class QuestionRow extends StatelessWidget {
  const QuestionRow(this._question, {Key? key}) : super(key: key);

  final String _question;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          _question,
          style: const TextStyle(
            color: AppColors.customWhite,
            fontSize: 26,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
