import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/error.dart';
import 'package:quiz_app/screen/win.dart';
import 'package:quiz_app/services/QuestionModel.dart';
import 'package:quiz_app/services/QuizQueCreator.dart';
import 'package:quiz_app/services/firedb.dart';
import 'package:quiz_app/widgets/lifeline_sidebar.dart';

// ignore: must_be_immutable
class Question extends StatefulWidget {
  String quizID;
  int queMoney;
  Question({required this.quizID, required this.queMoney});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionModel questionModel = new QuestionModel();
  genQue() async {
    await QuizQueCreator.genQuizQue(widget.quizID, widget.queMoney)
        .then((queData) {
      setState(() {
        questionModel.question = queData["question"];
        questionModel.correctAnswer = queData["correctAnswer"];
        List options = [
          queData["opt1"],
          queData["opt2"],
          queData["opt3"],
          queData["opt4"],
        ];
        options.shuffle();
        questionModel.option1 = options[0];
        questionModel.option2 = options[1];
        questionModel.option3 = options[2];
        questionModel.option4 = options[3];
      });
    });
  }

  bool optALocked = false;
  bool optBLocked = false;
  bool optCLocked = false;
  bool optDLocked = false;
  @override
  void initState() {
    genQue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/background.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Coins: ${widget.queMoney}",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 251, 100, 90),
        ),
        drawer: LifeLine_Drawer(),
        floatingActionButton: ElevatedButton(
          child: Text(
            "QUIT GAME",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: () {},
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 12.0,
                    backgroundColor: Colors.white,
                  ),
                  Center(
                      child: Text(
                    "60",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(14.0),
              margin: EdgeInsets.all(17.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                questionModel.question,
                style: GoogleFonts.robotoCondensed(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                print("Double tap to lock the answer");
              },
              onLongPress: () {
                setState(() {
                  optALocked = true;
                });
                Future.delayed(
                  Duration(seconds: 2),
                  () async {
                    if (questionModel.option1 == questionModel.correctAnswer) {
                      // print("Congratulation");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Win(widget.queMoney, widget.quizID),
                        ),
                      );
                    } else {
                      // print("What a pity");
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Looser(
                              wonMon: (widget.queMoney ~/ 2),
                              correctAns: questionModel.correctAnswer),
                        ),
                      );
                    }
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 17.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: optALocked
                      ? Colors.yellow.withOpacity(0.4)
                      : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  "A. ${questionModel.option1}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Double tap to lock the answer");
              },
              onLongPress: () {
                setState(() {
                  optBLocked = true;
                });
                Future.delayed(
                  Duration(seconds: 2),
                  () async {
                    if (questionModel.option2 == questionModel.correctAnswer) {
                      // print("Congratulation");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Win(widget.queMoney, widget.quizID),
                        ),
                      );
                    } else {
                      // print("What a pity");
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Looser(
                              wonMon: (widget.queMoney ~/ 2),
                              correctAns: questionModel.correctAnswer),
                        ),
                      );
                    }
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 17.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: optBLocked
                      ? Colors.yellow.withOpacity(0.4)
                      : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  "B. ${questionModel.option2}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Double tap to lock the answer");
              },
              onLongPress: () {
                setState(() {
                  optCLocked = true;
                });
                Future.delayed(
                  Duration(seconds: 2),
                  () async {
                    if (questionModel.option3 == questionModel.correctAnswer) {
                      // print("Congratulation");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Win(widget.queMoney, widget.quizID),
                        ),
                      );
                    } else {
                      // print("What a pity");
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Looser(
                              wonMon: (widget.queMoney ~/ 2),
                              correctAns: questionModel.correctAnswer),
                        ),
                      );
                    }
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 17.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: optCLocked
                      ? Colors.yellow.withOpacity(0.4)
                      : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  "C. ${questionModel.option3}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Double tap to lock the answer");
              },
              onLongPress: () {
                setState(() {
                  optDLocked = true;
                });
                Future.delayed(
                  Duration(seconds: 2),
                  () async {
                    if (questionModel.option4 == questionModel.correctAnswer) {
                      // print("Congratulation");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Win(widget.queMoney, widget.quizID),
                        ),
                      );
                    } else {
                      // print("What a pity");
                      await FireDB.updateMoney(widget.queMoney ~/ 2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Looser(
                              wonMon: (widget.queMoney ~/ 2),
                              correctAns: questionModel.correctAnswer),
                        ),
                      );
                    }
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 17.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: optDLocked
                      ? Colors.yellow.withOpacity(0.4)
                      : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  "D. ${questionModel.option4}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
