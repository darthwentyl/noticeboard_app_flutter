import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/datas/callback_types.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/utils/size_getter.dart';

class Categories extends StatelessWidget {
  Categories(this._setStateCallback, this._currState, {Key? key})
      : super(key: key);

  static const spacing = 6.0;
  VoidCallback<EWidgetStates> _setStateCallback;
  EWidgetStates _currState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: Center(
          child: Container(
            width: SizeGetter.width(context, 95.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: spacing,
                children: [
                  _button(ButtonStrings.categoriesPost, EWidgetStates.posts),
                  _button(
                      ButtonStrings.categoriesBuySell, EWidgetStates.buySell),
                  _button(ButtonStrings.categoriesAdvertisement,
                      EWidgetStates.advertisement),
                  _button(
                      ButtonStrings.categoriesContest, EWidgetStates.contest),
                  _button(ButtonStrings.categoriesVip, EWidgetStates.vip),
                  _button(ButtonStrings.categoriesInfo, EWidgetStates.info),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _button(String text, EWidgetStates state) {
    return _currState == state
        ? _selectButton(text, state)
        : _unselectButton(text, state);
  }

  _selectButton(String text, EWidgetStates state) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.textButtonSelectBackground,
        padding: const EdgeInsets.all(spacing),
      ),
      onPressed: () {
        _setStateCallback(state);
      },
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, color: AppColors.textButtonSelectText),
      ),
    );
  }

  _unselectButton(String text, EWidgetStates state) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.textButtonBackground,
        padding: const EdgeInsets.all(spacing),
      ),
      onPressed: () {
        _setStateCallback(state);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
