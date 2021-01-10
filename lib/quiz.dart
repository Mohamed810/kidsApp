import 'package:flutter/material.dart';
import 'package:learning_app/question.dart';

import 'answer.dart';

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
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "عدد النقاط: ",
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 25,
                  )
              ),
              TextSpan(
                text: "$Score",
                style: TextStyle(color: Colors.red, fontSize: 30.0,fontFamily: 'Lalezar',),
              )
            ],
          ),
        ),
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score'], answer['correct']),
              answer['text']);
        }).toList()
      ],
    );
  }
}
