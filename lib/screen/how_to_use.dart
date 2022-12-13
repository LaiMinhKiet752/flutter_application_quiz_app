import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/home.dart';

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/img/welcome_user.jpg",
                    filterQuality: FilterQuality.high,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: 200.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 111, 101),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "User manual",
                        style: GoogleFonts.openSans(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Hi user, I'm Robot, I will be in charge of teaching you how to use this KDV Quiz game",
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
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Step 1: You need to log in to the system with your Google or Facebook account",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_login.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Home interface is as follows",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_home.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Drawer interface",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_drawer.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Step 2: You can choose any question pack you want to play",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_unlock_quiz.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Here if the question pack is locked, you need to see if your account has more Coins than the price of the question pack to be able to unlock and play",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_start_quiz.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "The game screen is as follows",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_screen_question.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Here there will be four options A, B, C, D for you to choose from and only one is the most correct, if you choose correctly you will win",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_win.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Conversely, if you choose wrong, you will lose and will receive the corresponding number of 'Coins'",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_loose.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "You can use some of the help rights built into each question pack to get through the difficult questions",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_lifeline.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "The number of 'Coins' will be used for ranking in this game and cannot be exchanged for real money",
                style: GoogleFonts.secularOne(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/img/htu_rank.png",
                height: 500.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                height: 50.0,
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
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
