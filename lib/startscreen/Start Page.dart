import 'package:flutter/material.dart';

import '../home.dart';
import 'learnPage.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Container(padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      blurRadius: 9,
                      spreadRadius: -3,
                    ),
                  ],
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30),),
                ),
                child: Text(
                  'مرحباً بك لتتعلم اللغة العربية ',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Lalezar',
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LearnPage();
                }));
              },
              child: ContainerButtonStart(
                txt: 'تعلم',
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Home();
                }));
              },
              child: ContainerButtonStart(
                txt: 'إلعب',
                color: Colors.red,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//for container Of buttons learn and start
class ContainerButtonStart extends StatelessWidget {
  final Color color;
  final String txt;

  ContainerButtonStart({this.txt, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 9,
            spreadRadius: -3,
          ),
        ],
        color: this.color,
        borderRadius: BorderRadius.horizontal(right: Radius.circular(50),),
      ),
      child: Center(
        child: Text(
          '$txt',
          style: TextStyle(
            fontFamily: 'Lalezar',
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
