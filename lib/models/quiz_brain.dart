import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';

class QuizBrain{
  int questionNumber = 0;     // integer variable declaration
  List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  // Function definition for getting next question
  void nextQuestion(){
    if(questionNumber < questionBank.length - 1){
      questionNumber++;   // incrementing question number
    }
  }

  //  Function definition for displaying question text
  String getQuestionText(){
    return questionBank[questionNumber].questionText;
  }

  //  Function definition for getting answer
  bool getAnswer(){
    return questionBank[questionNumber].questionAnswer;
  }

  //  Function definition for checking whether questions are finished or not
  bool isFinished(){
    if(questionNumber >= questionBank.length-1){
      print("Returning True");
      return true;
    }else{
      print("Returning False");
      return false;
    }
  }

  //  Function definition for resetting quiz
  void resetQuiz(){
    questionNumber = 0;
  }
}