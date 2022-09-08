import 'package:noticeboard/controllers/robot_verify_questions_controller.dart';

class RobotVerifyQuestionsParser {
  final RobotVerifyQuestionsController _controller =
      RobotVerifyQuestionsController();
  List<String> getQuestions() {
    if (_controller.getQuestions().isEmpty) {
      return <String>[];
    }
    // TODO: implements parsing
    return <String>[];
  }
}
