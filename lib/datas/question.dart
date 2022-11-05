import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  Question(this.question, this.answer);

  final String question;
  final String answer;

  factory Question.fromJson(dynamic json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'question: $question; answer: $answer';
  }
}
