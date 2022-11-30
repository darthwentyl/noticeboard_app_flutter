import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_icons.dart';
import 'package:noticeboard/datas/callback_types.dart';

class MainPostsNavigationBar extends StatelessWidget {
  const MainPostsNavigationBar(this._onTapCallback, this._currentIdx,
      {Key? key})
      : super(key: key);

  final VoidCallback<int> _onTapCallback;
  final int _currentIdx;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildItem(AppIcons.home),
        _buildItem(AppIcons.add,
            background: AppColors.bottomNavigationBarItemBackground),
        _buildItem(AppIcons.person),
      ],
      backgroundColor: AppColors.bottomNavigationBarBackground,
      unselectedItemColor: AppColors.bottomNavigationBarUnselect,
      selectedItemColor: AppColors.bottomNavigationBarSelect,
      currentIndex: _currentIdx,
      onTap: (int idx) {
        _onTapCallback(idx);
      },
    );
  }

  _buildItem(Icon icon,
      {String label = '', Color background = AppColors.mainBackground}) {
    return BottomNavigationBarItem(
        icon: icon, label: label, backgroundColor: background);
  }
}
