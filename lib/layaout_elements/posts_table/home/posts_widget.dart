import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/controllers/posts_controller.dart';
import 'package:noticeboard/datas/post.dart';
import 'package:noticeboard/layaout_elements/loading_widget.dart';
import 'package:noticeboard/layaout_elements/posts_table/home/post_list_view_item.dart';
import 'package:noticeboard/utils/size_getter.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  final PostsController _postsController = PostsController();
  List<Post> _posts = [];
  bool _isLoaded = false;

  @override
  void initState() {
    _postsController.getPosts().then((value) {
      setState(() {
        _posts = value;
        _isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? Expanded(
            child: SizedBox(
              width: SizeGetter.width(context, 98.0),
              child: ListView.separated(
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int idx) {
                  return PostListViewItem(post: _posts[idx]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          )
        : const Expanded(
            child: LoadingWidget(),
          );
  }
}
