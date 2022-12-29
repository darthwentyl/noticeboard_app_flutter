// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emotion _$EmotionFromJson(Map<String, dynamic> json) => Emotion(
      json['likes'] as int,
      json['loves'] as int,
      json['hahas'] as int,
      json['angries'] as int,
      json['randoms'] as int,
    );

Map<String, dynamic> _$EmotionToJson(Emotion instance) => <String, dynamic>{
      'likes': instance.likes,
      'loves': instance.loves,
      'hahas': instance.hahas,
      'angries': instance.angries,
      'randoms': instance.randoms,
    };
