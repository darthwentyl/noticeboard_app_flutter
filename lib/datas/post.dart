import 'package:json_annotation/json_annotation.dart';
import 'package:noticeboard/datas/emotion.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post(this.author, this.title, this.emotion, this.comments, this.image_url);

  final String author;
  final String title;
  final Emotion emotion;
  final int comments;
  final String image_url;

  factory Post.fromJson(dynamic json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'author: $author; emotion: $emotion; comments: $comments; image_url: $image_url';
  }
}
