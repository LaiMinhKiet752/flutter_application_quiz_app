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
        margin: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Text(
              "The Tips For You",
              style: GoogleFonts.zenDots(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
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
              minWidth: 200.0,
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
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
