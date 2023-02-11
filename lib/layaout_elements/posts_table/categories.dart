import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_icons.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/datas/callback_types.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/utils/size_getter.dart';

class Categories extends StatelessWidget {
  Categories(this._setStateCallback, this._currState, {Key? key})
      : super(key: key);

  static const spacing = 6.0;
  static const buttonProportion = 5.0;
  final VoidCallback<EWidgetStates> _setStateCallback;
  final EWidgetStates _currState;
  late double _width;

  @override
  Widget build(BuildContext context) {
    _width = SizeGetter.width(context, 95.0);
    return Center(
      child: Container(
        width: SizeGetter.width(context, 98.0),
        decoration: const BoxDecoration(
          color: AppColors.boxBackground,
          borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
        ),
        child: Center(
          child: SizedBox(
            // width: SizeGetter.width(context, 95.0),
            width: _width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(ButtonStrings.categoriesPost, EWidgetStates.posts),
                const Spacer(),
                _button(ButtonStrings.categoriesBuySell, EWidgetStates.buySell),
                const Spacer(),
                _button(
                    ButtonStrings.categoriesPromotion, EWidgetStates.promotion),
                const Spacer(),
                _button(ButtonStrings.categoriesContest, EWidgetStates.contest),
                const Spacer(),
                _buttonWithIcon(AppIcons.diamond, EWidgetStates.vip),
              ],
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
        fixedSize: Size.fromWidth(_width / buttonProportion),
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
        fixedSize: Size.fromWidth(_width / buttonProportion),
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

  _buttonWithIcon(Icon icon, EWidgetStates state) {
    return _currState == state
        ? _selectButtonWithIcon(icon, state)
        : _unselectButtonWithIcon(icon, state);
  }

  _selectButtonWithIcon(Icon icon, state) {
    return SizedBox.square(
      dimension: 36,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.textButtonSelectBackground,
          padding: const EdgeInsets.all(spacing),
        ),
        onPressed: () {
          _setStateCallback(state);
        },
        child: icon,
      ),
    );
  }

  _unselectButtonWithIcon(Icon icon, state) {
    return SizedBox.square(
      dimension: 36,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.textButtonBackground,
          padding: const EdgeInsets.all(spacing),
        ),
        onPressed: () {
          _setStateCallback(state);
        },
        child: icon,
      ),
    );
  }
}
