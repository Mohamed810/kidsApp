import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var player = AudioCache();
  Map<String, bool> score = {};
  Map<String, String> choices = {
    'أ':'أسد',
    'ب':'بطة',
    'ت':'تفاحة',
    'ث':'ثعبان',
    'ج':'جمل',
    'ح':'حصان',
    'خ':'خروف',
    /*'د':'أسد',
    'ذ':'أسد',
    'ر':'أسد',
    'ز':'أسد',
    'س':'أسد',
    'ش':'أسد',
    'ص':'أسد',
    'ض':'أسد',
    'ط':'أسد',
    'ظ':'أسد',
    'ع':'أسد',
    'غ':'أسد',
    'ف':'أسد',
    'ق':'أسد',
    'ك':'أسد',
    'ل':'أسد',
    'م':'أسد',
    'ن':'أسد',
    'ه':'أسد',
    'و':'أسد',
    'ى':'أسد',*/
  };
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Your Scores'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((element){
              return Expanded(
                  child: Draggable(
                    data: element,
                    child: Text(score[element] == true ? '✔' : element,style: TextStyle(color: Colors.black,fontSize: 40)),
                    feedback: Text(element,style: TextStyle(color: Colors.black,fontSize: 40)),
                    childWhenDragging: Text(element,style: TextStyle(color: Colors.black,fontSize: 40)),
                  ),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((element){
              return buildTarget(element);
          }).toList()..shuffle(Random(index)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            score.clear();
            index++;
          });
        },
      ),
    );
  }
  Widget buildTarget(element){
    return DragTarget(
        // ignore: missing_return
        builder: (context, incoming, rejected){
          if(score[element] == true){
            return Container(
              color: Colors.white,
              child: Text('تم بنجاح'),
              alignment: Alignment.center,
              height: 30,
              width: 50,
            );
          }else{
            return Container(
              child:Text(choices[element],style: TextStyle(color: Colors.black,fontSize: 40)),
              alignment: Alignment.center,
              height: 50,
              width: 80,
            );
          }
        },
      onWillAccept: (data) => data == element,
      onAccept: (data) {
        setState(() {
          score[element] = true;
          player.play('clap.mp3');
        });
      },
      onLeave: (data) {},
    );
  }
}
/*class Movable extends StatelessWidget {
  final String char;
  Movable(this.char);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(char,style: TextStyle(color: Colors.black,fontSize: 40),),
      ),
    );
  }
}*/
