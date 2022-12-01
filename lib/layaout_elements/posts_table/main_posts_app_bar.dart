import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_icons.dart';
import 'package:noticeboard/datas/callback_types.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/utils/empty_size_box.dart';

class MainPostsAppBar {
  MainPostsAppBar(this._setStateCallback);

  VoidCallback<EWidgetStates> _setStateCallback;

  build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainBackground,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getUserAvatar(context),
          EmptySizeBox.get(width: 10.0),
          _getUserName(),
          const Spacer(),
          _getBellIcon(),
          EmptySizeBox.get(width: 10.0),
        ],
      ),
    );
  }

  _getUserAvatar(BuildContext context) {
    return const CircleAvatar(
      radius: 22.0, // TODO: It should be calculated
      backgroundColor: AppColors.customBlue,
      child: CircleAvatar(
        backgroundColor: AppColors.boxBackground,
        child: Text('MW'), // TODO: It should be taken from user profile
      ),
    );
  }

  _getUserName() {
    return const Text(
      'Michał Wendland',
      style: TextStyle(
        color: AppColors.customBlue,
        fontSize: 20.0, // TODO: Is it circle avatar radius?
        decoration: TextDecoration.none,
      ),
    );
  }

  _getBellIcon() {
    return InkWell(
      child: badge.Badge(
        position: badge.BadgePosition.topEnd(top: -15, end: -15),
        badgeContent: const Text(
          '+99',
          style: TextStyle(
            color: AppColors.customWhite,
            fontSize: 10.0, // TODO: Is it circle avatar radius?
            decoration: TextDecoration.none,
          ),
        ),
        shape: badge.BadgeShape.square,
        padding: const EdgeInsets.all(1.0),
        borderRadius: BorderRadius.circular(4.0),
        child: AppIcons.bell,
      ),
      onTap: () {
        _setStateCallback(EWidgetStates.bell);
      },
    );
  }
}
