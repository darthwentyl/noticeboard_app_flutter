import 'package:flutter/cupertino.dart';
import 'package:noticeboard/layouts/main_posts_table_layout.dart';

class MainPostsTablePage extends StatefulWidget {
  const MainPostsTablePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPostsTableState();
}

class _MainPostsTableState extends State<MainPostsTablePage> {
  @override
  Widget build(BuildContext context) {
    return const MainPostsTableLayout();
  }
}
