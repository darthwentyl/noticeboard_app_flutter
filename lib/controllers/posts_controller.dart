import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:noticeboard/datas/post.dart';

class PostsController {
  Future<List<Post>> getPosts() async {
    String postsJsonText = await _getPostJson();
    var postsObjJson = jsonDecode(postsJsonText)['posts'] as List;

    List<Post> posts =
        postsObjJson.map((tagJson) => Post.fromJson(tagJson)).toList();
    print("posts: $posts");
    return posts;
  }

  Future<String> _getPostJson() async {
    return await rootBundle.loadString('assets/jsons/posts.json');
  }
}
