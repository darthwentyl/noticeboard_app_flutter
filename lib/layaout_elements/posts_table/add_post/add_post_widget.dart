import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/utils/size_getter.dart';

class AddPostWidget extends StatelessWidget {
  const AddPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: SizeGetter.width(context, 98.0),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.boxBackground,
            borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _title(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.addPostTitle,
          style: const TextStyle(
            color: AppColors.customBlue,
            fontSize: 20.0,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
