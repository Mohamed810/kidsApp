import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:learning_app/models/LearningModel.dart';

class LearnPage extends StatefulWidget {
  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  var player = AudioCache();
  int index = 0;
  List<LearningModel> learningModel = [
    LearningModel(
        character: 'أ', characterVoice: 'أ.mp3', image: 'images/ارنب.png'),
    LearningModel(
        character: 'ب', characterVoice: 'ب.mp3', image: 'images/بطة.png'),
    LearningModel(
        character: 'ت', characterVoice: 'ت.mp3', image: 'images/تفاحة.png'),
    LearningModel(
        character: 'ث', characterVoice: 'ث.mp3', image: 'images/ثعلب.png'),
    LearningModel(
        character: 'ج', characterVoice: 'ج.mp3', image: 'images/جمل.png'),
    LearningModel(
        character: 'ح', characterVoice: 'ح.mp3', image: 'images/حمار.png'),
    LearningModel(
        character: 'خ', characterVoice: 'خ.mp3', image: 'images/خروف.png'),
    LearningModel(
        character: 'د', characterVoice: 'د.mp3', image: 'images/دب.png'),
    LearningModel(
        character: 'ذ', characterVoice: 'ذ.mp3', image: 'images/ذيل.png'),
    LearningModel(
        character: 'ر', characterVoice: 'ر.mp3', image: 'images/رمان.png'),
    LearningModel(
        character: 'ز', characterVoice: 'ز.mp3', image: 'images/زهرة.png'),
    LearningModel(
        character: 'س', characterVoice: 'س.mp3', image: 'images/سمكة.png'),
    LearningModel(
        character: 'ش', characterVoice: 'ش.mp3', image: 'images/شجرة.png'),
    LearningModel(
        character: 'ص', characterVoice: 'ص.mp3', image: 'images/صاروخ.png'),
    LearningModel(
        character: 'ض', characterVoice: 'ض.mp3', image: 'images/ضابط.png'),
    LearningModel(
        character: 'ط', characterVoice: 'ط.mp3', image: 'images/طائرة.png'),
    LearningModel(
        character: 'ظ', characterVoice: 'ظ.mp3', image: 'images/ظرف.png'),
    LearningModel(
        character: 'ع', characterVoice: 'ع.mp3', image: 'images/عصفور.png'),
    LearningModel(
        character: 'غ', characterVoice: 'غ.mp3', image: 'images/غسالة.png'),
    LearningModel(
        character: 'ف', characterVoice: 'ف.mp3', image: 'images/فيل.png'),
    LearningModel(
        character: 'ق', characterVoice: 'ق.mp3', image: 'images/قلم.png'),
    LearningModel(
        character: 'ك', characterVoice: 'ك.mp3', image: 'images/كتاب.png'),
    LearningModel(
        character: 'ل', characterVoice: 'ل.mp3', image: 'images/لعب.png'),
    LearningModel(
        character: 'م', characterVoice: 'م.mp3', image: 'images/مفتاح.png'),
    LearningModel(
        character: 'ن', characterVoice: 'ن.mp3', image: 'images/نحلة.png'),
    LearningModel(
        character: 'ه', characterVoice: 'ه.mp3', image: 'images/هدية.png'),
    LearningModel(
        character: 'و', characterVoice: 'و.mp3', image: 'images/ورقة.png'),
    LearningModel(
        character: 'ي', characterVoice: 'ى.mp3', image: 'images/يمامة.png')
  ];

  @override
  Widget build(BuildContext context) {
    void Incremet() {
      setState(() {
        index++;
        if (index > learningModel.length - 1) index = 0;
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
                  child: Image.asset('${learningModel[index].image}'),
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
                    player.play('${learningModel[index].characterVoice}');
                  });
                },
                child: Container(
                  child: Center(
                    child: Text(
                      '${learningModel[index].character}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ),
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
