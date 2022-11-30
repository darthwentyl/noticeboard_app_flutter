import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post(this.author, this.title, this.likes, this.comments, this.image_url);

  final String author;
  final String title;
  final int likes;
  final int comments;
  final String image_url;

  factory Post.fromJson(dynamic json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'author: $author; likes: $likes; comments: $comments; image_url: $image_url';
  }
}
