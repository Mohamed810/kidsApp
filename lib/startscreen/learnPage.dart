import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  var player = AudioCache();
  int index = 0;
  List<String> characters = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ھ',
    'و',
    'ي'
  ];
  List<String> images = [
    'images/ارنب.png',
    'images/بطة.png',
    'images/تفاحة.png',
    'images/ثعلب.png',
    'images/جمل.png',
    'images/حمار.png',
    'images/خروف.png',
    'images/دب.png',
    'images/ذيل.png',
    'images/رمان.png',
    'images/زهرة.png',
    'images/سمكة.png',
    'images/شجرة.png',
    'images/صاروخ.png',
    'images/ضابط.png',
    'images/طائرة.png',
    'images/ظرف.png',
    'images/عصفور.png',
    'images/غسالة.png',
    'images/فيل.png',
    'images/قلم.png',
    'images/كتاب.png',
    'images/لعب.png',
    'images/مفتاح.png',
    'images/نحلة.png',
    'images/هدية.png',
    'images/ورقة.png',
    'images/يمامة.png',
  ];
  List<String> voiceWord = [
    'assets/words/ارنب.mp3',
    'assets/words/بطة.mp3',
    'assets/words/تفاحة.mp3',
    'assets/words/ثعلب.mp3',
    'assets/words/جمل.mp3',
    'assets/words/حمار.mp3',
    'assets/words/خروف.mp3',
    'assets/words/دب.mp3',
    'assets/words/ذيل.mp3',
    'assets/words/رمان.mp3',
    'assets/words/زهرة.mp3',
    'assets/words/سمكة.mp3',
    'assets/words/شجرة.mp3',
    'assets/words/صاروخ.mp3',
    'assets/words/ضابط.mp3',
    'assets/words/طائرة.mp3',
    'assets/words/ظرف.mp3',
    'assets/words/عصفور.mp3',
    'assets/words/غسالة.mp3',
    'assets/words/فيل.mp3',
    'assets/words/قلم.mp3',
    'assets/words/كتاب.mp3',
    'assets/words/لعب.mp3',
    'assets/words/مفتاح.mp3',
    'assets/words/نحلة.mp3',
    'assets/words/هدية.mp3',
    'assets/words/ورقة.mp3',
    'assets/words/يمامة.mp3'
  ];
  List<String> voicechar = [
    'أ.mp3',
    'ب.mp3',
    'ت.mp3',
    'ث.mp3',
    'ج.mp3',
    'ح.mp3',
    'خ.mp3',
    'د.mp3',
    'ذ.mp3',
    'ر.mp3',
    'ز.mp3',
    'س.mp3',
    'ش.mp3',
    'ص.mp3',
    'ض.mp3',
    'ط.mp3',
    'ظ.mp3',
    'ع.mp3',
    'غ.mp3',
    'ف.mp3',
    'ق.mp3',
    'ك.mp3',
    'ل.mp3',
    'م.mp3',
    'ن.mp3',
    'ه.mp3',
    'و.mp3',
    'ى.mp3'
  ];

  @override
  Widget build(BuildContext context) {
    void Incremet() {
      setState(() {
        index++;
        if (index > images.length - 1) index = 0;
      });
    }

    void Decremet() {
      setState(() {
        index--;
        if (index < 1) index = 0;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'تعلم',
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                icon: Icons.arrow_left_rounded,
                incrementOrDecrement: Decremet,
              ),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset.zero,
                        blurRadius: 9,
                        spreadRadius: -3,
                      ),
                    ],
                    color: Color(0xFF364f6b),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset('${images[index]}'),
                ),
              ),
              ImageIcon(
                icon: Icons.arrow_right_rounded,
                incrementOrDecrement: Incremet,
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
                  setState(() {
                    player.play('${voicechar[index]}');
                  });
                },
                child: Container(
                  child: Center(
                      child: Text(
                    '${characters[index]}',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Lalezar',
                    ),
                  )),
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset.zero,
                        blurRadius: 9,
                        spreadRadius: -3,
                      ),
                    ],
                    color: Color(0xFF3f72af),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50),
                      right: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageIcon extends StatelessWidget {
  final IconData icon;
  final Function incrementOrDecrement;

  ImageIcon({this.icon, this.incrementOrDecrement});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          this.incrementOrDecrement();
        },
        child: Icon(this.icon, color: Color(0xFF3f72af), size: 100));
  }
}
