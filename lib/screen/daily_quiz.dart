import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/home.dart';

class DailyQuiz extends StatefulWidget {
  const DailyQuiz({super.key});

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: 600.0,
                width: 500.0,
                margin: EdgeInsets.only(left: 50.0, top: 100.0, right: 50.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Color.fromARGB(255, 204, 249, 172)
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 56.0,
                child: Container(
                  child: Image.asset(
                    "assets/img/daily_quiz_1.png",
                    width: 100.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 100.0,
                right: 1.5,
                child: Container(
                  child: Image.asset(
                    "assets/img/daily_quiz_2.gif",
                    width: 100.0,
                  ),
                ),
              ),
              Positioned(
                left: 90.0,
                top: 150.0,
                child: Container(
                  height: 500.0,
                  width: 230.0,
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Have a nice day. \nWe hope you will have an enjoyable experience with our game. \nAnd today there will be four question packs related to four common topics: \n\nMath \nPhysics \nChemistry \nLiterature \n\nThere are also two more special question packs covering many areas of life. \n\nDon't wait any longer, let's play now!",
                        textStyle: GoogleFonts.secularOne(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 35.0,
                left: 120.0,
                child: MaterialButton(
                  height: 50.0,
                  minWidth: 150.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color.fromARGB(255, 251, 100, 90),
                  child: Text(
                    "Let's play now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
