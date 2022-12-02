import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:noticeboard/datas/post.dart';
import 'package:noticeboard/datas/post_type.dart';

class PostsController {
  PostsController(this.postType);

  EPostType postType;

  Future<List<Post>> getPosts() async {
    String postsJsonText = await _getPostJson();
    var postsObjJson = jsonDecode(postsJsonText)['posts'] as List;

    List<Post> posts =
        postsObjJson.map((tagJson) => Post.fromJson(tagJson)).toList();
    print("posts: $posts");
    return posts;
  }

  Future<String> _getPostJson() async {
    if (postType == EPostType.post) {
      return await rootBundle.loadString('assets/jsons/posts.json');
    } else {
      return await rootBundle.loadString('assets/jsons/buy_sell.json');
    }
  }
}
