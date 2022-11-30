import 'package:flutter/material.dart';
import 'package:noticeboard/controllers/widget_state_controller.dart';
import 'package:noticeboard/datas/widget_states.dart';
import 'package:noticeboard/layaout_elements/posts_table/categories.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_app_bar.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_navigation_bar.dart';

class MainPostsTableLayout extends StatefulWidget {
  const MainPostsTableLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPostsTableLayout();
}

class _MainPostsTableLayout extends State<MainPostsTableLayout> {
  int _selectedBottomNavigationItem = 0;

  final _key = GlobalKey();
  late final WidgetStateController _widgetStateController;

  @override
  void initState() {
    _widgetStateController = WidgetStateController(_key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPostsAppBar().build(context),
      body: Column(
        children: [
          Categories(_onSetCategories, _widgetStateController.getState()),
          _widgetStateController.getWidget(),
        ],
      ),
      bottomNavigationBar: MainPostsNavigationBar(
          _onSelectBottomNavigationItem, _selectedBottomNavigationItem),
    );
  }

  void _onSelectBottomNavigationItem(int idx) {
    setState(() {
      _selectedBottomNavigationItem = idx;
    });
  }

  void _onSetCategories(EWidgetStates state) {
    setState(() {
      _widgetStateController.setState(state);
    });
  }
}
