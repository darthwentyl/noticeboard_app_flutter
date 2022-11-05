import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:noticeboard/datas/question.dart';

class RobotVerifyQuestionsController {
  // FIXME: Now it is a stub. In future it will be asked from data base
  Future<List<Question>> getQuestions() async {
    String questionnaireJsonText = await _getQuestionnaireJson();
    var questionsObjJson =
        jsonDecode(questionnaireJsonText)['questions'] as List;

    List<Question> questions =
        questionsObjJson.map((tagJson) => Question.fromJson(tagJson)).toList();
    return questions;
  }

  Future<String> _getQuestionnaireJson() async {
    return await rootBundle.loadString('assets/questions/questionnaire.json');
  }
}
