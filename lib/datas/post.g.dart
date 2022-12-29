// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['author'] as String,
      json['title'] as String,
      Emotion.fromJson(json['emotion']),
      json['comments'] as int,
      json['image_url'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'emotion': instance.emotion,
      'comments': instance.comments,
      'image_url': instance.image_url,
    };
