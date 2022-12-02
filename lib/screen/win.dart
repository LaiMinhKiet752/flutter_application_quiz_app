import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/question.dart';
import 'package:quiz_app/services/firedb.dart';

// ignore: must_be_immutable
class Win extends StatefulWidget {
  late int queMoney;
  late String QuizID;
  Win(this.queMoney, this.QuizID);
  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  Future<bool?> showWarning(
          {required BuildContext context,
          required String title,
          required String content}) async =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No!")),
            ElevatedButton(
                onPressed: () async {
                  await FireDB.updateMoney(widget.queMoney);
                  Navigator.pop(context, true);
                },
                child: Text("Okay!")),
          ],
        ),
      );

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final exitQuiz = await showWarning(
            context: context,
            title: "DO YOU WANT TO EXIT QUIZ ?",
            content: "You will get Coins: ${widget.queMoney} In Your Account.");
        return exitQuiz ?? false;
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/win.jpg"),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONGRATULATIONS",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "YOUR ANSWER IS CORRECT",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "You Won",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Coins: ${widget.queMoney}",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/img/cheque.jpg",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Question(
                              quizID: widget.QuizID,
                              queMoney: (widget.queMoney) * 2,
                            ),
                          ),
                        );
                      },
                      child: Text("Next Question"),
                    ),
                  ],
                ),
              ),
              buildConfettiWidget(confettiController, pi / 2),
            ],
          ),
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20.0,
        minBlastForce: 8.0,
        emissionFrequency: 0.2,
        numberOfParticles: 8,
        gravity: 0.3,
      ),
    );
  }
}
