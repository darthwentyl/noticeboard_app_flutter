// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['author'] as String,
      json['title'] as String,
      json['likes'] as int,
      json['comments'] as int,
      json['image_url'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'likes': instance.likes,
      'comments': instance.comments,
      'image_url': instance.image_url,
    };
