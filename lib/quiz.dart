import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final int Score;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
    @required this.Score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(TextSpan(
            children: [
              TextSpan(text: "عدد النقاط: ",style: TextStyle(fontSize: 25,)),
              TextSpan(text: "$Score", style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0
              ))
            ]
        )),
        Question(
          questions[questionIndex]['questionText'],
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score'],answer['correct']), answer['text']);
        }).toList()
      ],
    ); //Column
  }
}
