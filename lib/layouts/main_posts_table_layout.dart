import 'package:flutter/material.dart';
import 'package:noticeboard/layaout_elements/posts_table/main_posts_app_bar_builder.dart';
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
      appBar: MainPostsAppBarBuilder().build(context),
      body: Center(
        child: Text(
          'select item: $_selectedBottomNavigationItem',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
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
