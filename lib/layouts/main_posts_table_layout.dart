import 'package:flutter/material.dart';
import 'package:noticeboard/layaout_elements/posts_table/categories.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_app_bar.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_navigation_bar.dart';

class MainPostsTableLayout extends StatefulWidget {
  const MainPostsTableLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPostsTableLayout();
}

class _MainPostsTableLayout extends State<MainPostsTableLayout> {
  // TODO: move to enum
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPostsAppBar().build(context),
      body: Column(
        children: [
          Categories(),
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
}
