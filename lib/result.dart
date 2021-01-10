import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:learning_app/startscreen/Start%20Page.dart';

import 'level2.dart';

class Result extends StatelessWidget {
  var player = AudioCache();
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'انت مذهل!';
      player.play('clap.mp3');
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'محبوب جدا!';
      player.play('clap.mp3');
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'أنت بحاجة إلى العمل أكثر!';
    } else if (resultScore >= 1) {
      resultText = 'أنت بحاجة إلى العمل الجاد!';
    } else {
      resultText = 'هذه نتيجة سيئة!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,fontFamily: 'Lalezar',),
            textAlign: TextAlign.center,
          ),
          Text(
            'عدد النقاط ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,fontFamily: 'Lalezar',),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'أعادة الامتحان!',
              style: TextStyle(fontSize: 30,fontFamily: 'Lalezar',),
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
          FlatButton(
            child: Text(
              'الي المستوي التالي!',
              style: TextStyle(fontSize: 30,fontFamily: 'Lalezar',),
            ),
            textColor: Colors.orange,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Draging();
              }));
            },
          ),
          FlatButton(
            child: Text(
              'إلى صفحة البدء',
              style: TextStyle(fontSize: 30,fontFamily: 'Lalezar',),
            ),
            textColor: Colors.green,
            onPressed: (){
              Navigator.pop(context);

            },
          ),
        ],
      ),
    );
  }
}
