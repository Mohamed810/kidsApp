import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Draging extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Draging> {
  var player = AudioCache();
  Map<String, bool> draging = {};
  Map<String, String> choices = {
    '🍎': 'تفاحة',
    '🍅': 'طماطم',
    '🥕': 'جزر',
    '🍋': 'ليمون',
    '🍊': 'برتقال',
    '🍇': 'عنب',
    '🌽': 'ذرة',
  };
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'ألعب',
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((element) {
              return Expanded(
                child: Draggable<String>(
                  data: element,
                  child: Movable(draging[element] == true ? '✔️' : element),
                  feedback: Text(
                    element,
                    style: TextStyle(color: Colors.black, fontSize: 50,decoration: TextDecoration.none),
                  ),
                  childWhenDragging: Movable('🐰'),
                ),
              );
            }).toList(),
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((element) {
              return buildTarget(element);
            }).toList()
              ..shuffle(Random(index)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            draging.clear();
            index++;
          });
        },
      ),
    );
  }

  Widget buildTarget(element) {
    return DragTarget<String>(
      builder: (context, incoming, rejected) {
        if (draging[element] == true) {
          return Container(
            color: Colors.white,
            child: Text('احسنت!',style: TextStyle(color: Colors.black, fontSize: 20)),
            alignment: Alignment.center,
            height: 50,
            width: 200,

          );
        } else {
          return Container(
            child: Text(
                choices[element],
                style: TextStyle(color: Colors.black,fontSize: 25,fontFamily: 'Lalezar',)
            ),
            alignment: Alignment.center,
            height: 50,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == element,
      onAccept: (data) {
        setState(() {
          draging[element] = true;
          player.play('clap.mp3');
        });
      },
      onLeave: (data) {},
    );
  }
}

class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 30,
        padding: EdgeInsets.all(15),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
    );
  }
}