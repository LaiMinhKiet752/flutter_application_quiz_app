import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/home.dart';

class Tips extends StatefulWidget {
  const Tips({super.key});

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  'The Tips For',
                  style: GoogleFonts.zenDots(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 500),
                    animatedTexts: [
                      RotateAnimatedText(
                        'You',
                        textStyle: GoogleFonts.zenDots(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      RotateAnimatedText(
                        'Everyone',
                        textStyle: GoogleFonts.zenDots(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.asset(
              "assets/img/tips_question.png",
              filterQuality: FilterQuality.high,
            ),
            SizedBox(
              height: 100.0,
            ),
            MaterialButton(
              height: 50.0,
              minWidth: 150.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Color.fromARGB(255, 251, 100, 90),
              child: Text(
                "Back to Home",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                await Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
