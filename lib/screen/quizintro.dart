import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/question.dart';
import 'package:quiz_app/services/checkQuizUnlock.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/services/quiz_money_check.dart';

// ignore: must_be_immutable
class QuizIntro extends StatefulWidget {
  late String QuizName;
  late String QuizImgUrl;
  late String QuizTopics;
  late String QuizDuration;
  late String QuizAbout;
  late String QuizID;
  late String QuizPrice;
  QuizIntro(
      {super.key,
      required this.QuizAbout,
      required this.QuizDuration,
      required this.QuizName,
      required this.QuizTopics,
      required this.QuizID,
      required this.QuizPrice});

  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  setLifeAvail() async {
    await LocalDB.saveAud(true);
    await LocalDB.saveChan(true);
    await LocalDB.saveFifty(true);
    await LocalDB.saveExp(true);
    final player = AudioCache();
    player.play("audio_effects/KBC_INTRO.mp3");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Question(quizID: widget.QuizID, queMoney: 5000)));
  }

  bool quizIsUnlocked = false;
  getQuizUnlockStatus() async {
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizID)
        .then((unlockStatus) {
      setState(() {
        quizIsUnlocked = unlockStatus;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getQuizUnlockStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: Text(
          quizIsUnlocked ? "START QUIZ" : "UNLOCK QUIZ",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () async {
          quizIsUnlocked
              ? setLifeAvail()
              : QuizMoneyCheck.buyQuiz(
                      QuizID: widget.QuizID,
                      QuizPrice: int.parse(widget.QuizPrice))
                  .then(
                  (quizBought) {
                    if (quizBought) {
                      setState(() {
                        quizIsUnlocked = true;
                      });
                    } else {
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "You do not have enough money to buy this Quiz!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text("KDV - Quiz Game"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextLiquidFill(
                        loadDuration: const Duration(seconds: 5),
                        text: '${widget.QuizName}',
                        waveColor: Colors.blue,
                        boxBackgroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 100.0,
                      ),
                    ),
                    Image.asset(
                      "assets/img/quiz_intro_image.jpg",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.topic_outlined),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "Related To - ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Text(
                            widget.QuizTopics,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "Duration - ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${widget.QuizDuration} Seconds",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    quizIsUnlocked
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.money),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "Money - ",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Unlock Conis: ${widget.QuizPrice}",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                    Container(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.app_registration_sharp),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "About Quiz - ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Text(
                            widget.QuizAbout,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
