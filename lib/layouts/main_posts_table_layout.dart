import 'package:flutter/material.dart';
import 'package:noticeboard/controllers/widget_state_controller.dart';
import 'package:noticeboard/datas/post_types.dart';
import 'package:noticeboard/datas/promotion_types.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/layaout_elements/posts_table/add_post/add_post_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/bell/notification_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/categories.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/posts_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/promotion_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/vip_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_app_bar.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_navigation_bar.dart';
import 'package:noticeboard/utils/empty_size_box.dart';

class MainPostsTableLayout extends StatefulWidget {
  const MainPostsTableLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPostsTableLayout();
}

class _MainPostsTableLayout extends State<MainPostsTableLayout> {
  _MainPostsTableLayout() {
    _widgetStateController.registerWidget(EWidgetStates.posts,
        PostsWidget(postType: EPostTypes.post, key: UniqueKey()));
    _widgetStateController.registerWidget(EWidgetStates.buySell,
        PostsWidget(postType: EPostTypes.buySell, key: UniqueKey()));
    _widgetStateController.registerWidget(
        EWidgetStates.promotion,
        PromotionWidget(
            promotionTypes: EPromotionTypes.promotion, key: UniqueKey()));
    _widgetStateController.registerWidget(
        EWidgetStates.contest,
        PromotionWidget(
            promotionTypes: EPromotionTypes.contest, key: UniqueKey()));
    _widgetStateController.registerWidget(
        EWidgetStates.vip, VipWidget(key: UniqueKey()));
    _widgetStateController.registerWidget(
        EWidgetStates.bell, NotificationWidget(key: UniqueKey()));
    _widgetStateController.registerWidget(
        EWidgetStates.addPost, AddPostWidget(key: UniqueKey()));
  }

  int _selectedBottomNavigationItem = 0;

  final WidgetStateController _widgetStateController = WidgetStateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPostsAppBar(_onSetWidgetState).build(context),
      body: Column(
        children: [
          if (_isShowCategories())
            Categories(_onSetWidgetState, _widgetStateController.getState()),
          EmptySizeBox.get(height: 15.0),
          _widgetStateController.getWidget(),
          EmptySizeBox.get(height: 15.0),
        ],
      ),
      bottomNavigationBar: MainPostsNavigationBar(
          _onSelectBottomNavigationItem, _selectedBottomNavigationItem),
    );
  }

  void _onSelectBottomNavigationItem(int idx) {
    setState(() {
      _selectedBottomNavigationItem = idx;
      _setLayout();
    });
  }

  void _onSetWidgetState(EWidgetStates state) {
    setState(() {
      _widgetStateController.setState(state);
      if (state == EWidgetStates.bell) {
        _selectedBottomNavigationItem = -1;
      }
    });
  }

  _setLayout() {
    switch (_selectedBottomNavigationItem) {
      case 0:
        _onSetWidgetState(EWidgetStates.posts);
        break;
      case 1:
        _onSetWidgetState(EWidgetStates.addPost);
        break;
      case 2:
        _onSetWidgetState(EWidgetStates.user);
        break;
    }
  }

  _isShowCategories() {
    if (_widgetStateController.getState() == EWidgetStates.user ||
        _widgetStateController.getState() == EWidgetStates.addPost ||
        _widgetStateController.getState() == EWidgetStates.bell) {
      return false;
    }
    return true;
  }
}
