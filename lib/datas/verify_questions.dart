class Question {
  final String question;
  final String answer;

  Question(this.question, this.answer);

  factory Question.fromJson(dynamic json) {
    return Question(json['question'] as String, json['answer'] as String);
  }
}
