import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/models/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];      // list definition for scores
  Widget check = Icon(Icons.check, color: Colors.lightGreen,);    // Icon for True
  Widget cross = Icon(Icons.close, color: Colors.redAccent,);     // Icon for False
  QuizBrain quizBrain = QuizBrain();    // object definition

  //  Function definition for choice
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: "Quiz Finished",
          desc: "You have reached at the end of the quiz...",
        ).show();
        quizBrain.resetQuiz();
        scoreKeeper = [];
      } else {
        if(userPickedAnswer == correctAnswer){
          scoreKeeper.add(check);
        } else{
          scoreKeeper.add(cross);
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Text(
                  quizBrain.getQuestionText(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            RaisedButton(
              onPressed: (){
                checkAnswer(true);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              color: Colors.lightGreen,
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              onPressed: (){
                checkAnswer(false);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ),
              color: Colors.redAccent,
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
