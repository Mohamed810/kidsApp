import 'dart:math';

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _questions = const [
    {
      'questionText': 'كلمة تبدأ بحرف أ ؟',
      'answers': [
        {'text': 'حمار', 'score': -2, 'correct': false},
        {'text': 'بطة', 'score': -2, 'correct': false},
        {'text': 'أرنب', 'score': 10, 'correct': true},
        {'text': 'يمامة', 'score': -2, 'correct': false},
      ],
    },
    {
      'questionText': 'كلمة تبدأ بحرف ت ؟',
      'answers': [
        {'text': 'ثعبان', 'score': -2, 'correct': false},
        {'text': 'دب', 'score': -2, 'correct': false},
        {'text': 'كلب', 'score': -2, 'correct': false},
        {'text': 'تمر', 'score': 10, 'correct': true},
      ],
    },
    {
      'questionText': 'كلمة تبدأ بحرف ج ؟',
      'answers': [
        {'text': 'حصان', 'score': -2, 'correct': false},
        {'text': 'جمل', 'score': 10, 'correct': true},
        {'text': 'تفاحة', 'score': -2, 'correct': false},
        {'text': 'قطة', 'score': -2, 'correct': false},
      ],
    },
    {
      'questionText': 'كلمة تبدأ بحرف س ؟',
      'answers': [
        {'text': 'سكين', 'score': 10, 'correct': true},
        {'text': 'قلم', 'score': -2, 'correct': false},
        {'text': 'شجرة', 'score': -2, 'correct': false},
        {'text': 'ضابط', 'score': -2, 'correct': false},
      ],
    },
    {
      'questionText': 'هل كلمة عصفور تبدأ بحرف ع ؟',
      'answers': [
        {'text': 'نعم', 'score': 10, 'correct': true},
        {'text': 'لا', 'score': -2, 'correct': false},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score,bool correct) {
    _totalScore += score;
    if(correct == true)
      {
        setState(() {
          _questionIndex = _questionIndex + 1;
        });
      }
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'ألعب',
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
            Score: _totalScore,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
    );
  }
}
