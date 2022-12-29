import 'package:json_annotation/json_annotation.dart';

part 'emotion.g.dart';

@JsonSerializable()
class Emotion {
  Emotion(this.likes, this.loves, this.hahas, this.angries, this.randoms);

  final int likes;
  final int loves;
  final int hahas;
  final int angries;
  final int randoms;

  factory Emotion.fromJson(dynamic json) => _$EmotionFromJson(json);
  Map<String, dynamic> toJson() => _$EmotionToJson(this);

  @override
  String toString() {
    return 'likes: $likes, loves: $loves, hahas: $hahas, angries: $angries, randoms: $randoms';
  }
}
