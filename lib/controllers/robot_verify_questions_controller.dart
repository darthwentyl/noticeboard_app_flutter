import 'dart:convert';
import 'package:noticeboard/datas/verify_questions.dart';

class RobotVerifyQuestionsController {
  // FIXME: Now it is a stub. In future it will be asked from datas base
  List<Question> getQuestions() {
    String jsonStr = "{";
    jsonStr += "\"questions\": [ ";
    jsonStr += "{";
    jsonStr += "\"question\": \"2+2=4\",";
    jsonStr += "\"answer\": \"tak\"";
    jsonStr += "},";
    jsonStr += "{";
    jsonStr += "\"question\": \"3+3=6\",";
    jsonStr += "\"answer\": \"tak\"";
    jsonStr += "},";
    jsonStr += "{";
    jsonStr += "\"question\": \"3+3=4\",";
    jsonStr += "\"answer\": \"nie\"";
    jsonStr += "},";
    jsonStr += "{";
    jsonStr += "\"question\": \"2+2=5\",";
    jsonStr += "\"answer\": \"nie\"";
    jsonStr += "}";
    jsonStr += "]";
    jsonStr += "}";

    var questionsObjJson = jsonDecode(jsonStr)['questions'] as List;
    List<Question> questions =
        questionsObjJson.map((tagJson) => Question.fromJson(tagJson)).toList();

    return questions;
  }
}
