import 'question.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        'The first version of Flutter was known as codename Sky and ran on the Android operating system.',
        true),
    Question('Flutter is developed by Facebook.', false),
    Question('Column widget use for layout.', true),
    Question('Flutter use platform primitives.', false),
    Question('Flutter uses one code base.', true),
    Question('ListView widgets used for repeating the content.', true),
    Question('Flutter is used to develop applications for both Android & iOS.',
        true),
    Question('Flutter is an app development library.', false),
    Question(
        'Flutter apps are written in the Dart language and make use of many of the language\'s more advanced features.',
        true),
    Question(
        'Due to App Store restrictions on dynamic code execution, Flutter apps use Ahed-of-Code (AOC) compilation on iOS.',
        false),
    Question(
        'Flutter\'s engine, written primarily in C++, provides low-level rendering support using Google\'s Skia graphics library..',
        true),
    Question(
        'A notable feature of the Dart platform is its support for hot reload.',
        true),
    Question(' Flutter is only supported on Windows.', false),
    Question(' Flutter is Free.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answerText;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
