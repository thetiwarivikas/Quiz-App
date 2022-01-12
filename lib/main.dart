import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';

Quiz quiz = Quiz();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Scaffold(
            backgroundColor: Colors.blue[800],
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.deepPurple,
                ],
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: MyQuizApp(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyQuizApp extends StatefulWidget {
  @override
  MyQuizAppState createState() => MyQuizAppState();
}

class MyQuizAppState extends State<MyQuizApp> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quiz.getCorrectAnswer();

    setState(() {
      if (quiz.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quiz.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quiz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: Text(
              'Quiz',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 10.0,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurple,
                      Colors.blue,
                    ],
                  )),
              child: Center(
                child: Text(quiz.getQuestionText(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: FloatingActionButton.large(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.thumb_up),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: FloatingActionButton.large(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.thumb_down),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
      ],
    );
  }
}
