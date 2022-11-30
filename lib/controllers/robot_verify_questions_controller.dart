import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:noticeboard/datas/question.dart';

class RobotVerifyQuestionsController {
  RobotVerifyQuestionsController(this._numOfQuestions);

  int _numOfQuestions = 0;

  // FIXME: Now it is a stub. In future it will be asked from data base
  Future<List<Question>> getQuestions() async {
    String questionnaireJsonText = await _getQuestionnaireJson();
    var questionsObjJson =
        jsonDecode(questionnaireJsonText)['questions'] as List;

    List<Question> questions =
        questionsObjJson.map((tagJson) => Question.fromJson(tagJson)).toList();

    return _takeRandomQuestions(questions);
  }

  Future<String> _getQuestionnaireJson() async {
    return await rootBundle.loadString('assets/jsons/questionnaire.json');
  }

  List<Question> _takeRandomQuestions(List<Question> questions) {
    List<Question> chosenQuestions = [];
    final randomController = Random();

    while (_numOfQuestions != 0) {
      int idx = randomController.nextInt(questions.length);
      chosenQuestions.add(questions[idx]);
      questions.removeAt(idx);
      _numOfQuestions--;
    }

    return chosenQuestions;
  }
}
