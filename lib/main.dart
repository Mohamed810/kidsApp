import 'package:flutter/material.dart';
import 'package:learning_app/startscreen/Start%20Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'تعلم اللغة العربية',
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: StartPage(),
        ),
      ),
    );
  }
}
