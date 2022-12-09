import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components.dart';

class AboutThem extends StatefulWidget {
  const AboutThem({super.key});

  @override
  State<AboutThem> createState() => _AboutThemState();
}

class _AboutThemState extends State<AboutThem> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(text,
          style: GoogleFonts.openSans(
            fontSize: 15.0,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    AnimatedTextKit(
                      totalRepeatCount: 100,
                      animatedTexts: [
                        TyperAnimatedText(
                          "About KDV Quiz",
                          textStyle: GoogleFonts.zenDots(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              //Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/img/about_1.png",
                    width: double.infinity,
                    reverse: true,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    text: "Various question packs",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text:
                    "With more than 100 questions from all fields will help you gain more useful new knowledge",
                size: 15.0,
              ),
              //App development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "assets/img/about_2.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    text: "General questions",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text:
                    "Questions are classified according to a single topic or many topics will help you have interesting experiences",
                size: 15.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              //Back end development, forth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "assets/img/about_3.jpg",
                    width: double.infinity,
                    reverse: true,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold(
                    text: "Quiz night",
                    size: 20.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                text:
                    "If you want to add to your knowledge, just spend 5 minutes playing in the evening",
                size: 15.0,
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
