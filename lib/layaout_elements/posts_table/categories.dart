import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  static const spacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: spacing, right: spacing),
          child: Wrap(
            spacing: spacing,
            children: [
              _button(ButtonStrings.categoriesPost),
              _button(ButtonStrings.categoriesBuySell),
              _button(ButtonStrings.categoriesAdverisment),
              _button(ButtonStrings.categoriesContest),
              _button(ButtonStrings.categoriesVip),
              _button(ButtonStrings.categoriesInfo),
            ],
          ),
        ),
      ),
    );
  }

  _button(String text) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.textButtonBackground,
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}