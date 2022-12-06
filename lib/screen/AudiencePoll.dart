import 'dart:math';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AudiencePoll extends StatefulWidget {
  late String question;
  late String opt1;
  late String opt2;
  late String opt3;
  late String opt4;
  late String correctAns;
  AudiencePoll(
      {required this.question,
      required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<AudiencePoll> createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {
  @override
  void initState() {
    super.initState();
    VotingMachine();
  }

  int opt1Votes = 0;
  int opt2Votes = 0;
  int opt3Votes = 0;
  int opt4Votes = 0;
  bool isVoting = true;
  VotingMachine() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        if (widget.opt1 == widget.correctAns) {
          opt1Votes = Random().nextInt(50) + 50;
        } else {
          opt1Votes = Random().nextInt(40);
        }

        if (widget.opt2 == widget.correctAns) {
          opt2Votes = Random().nextInt(50) + 50;
        } else {
          opt2Votes = Random().nextInt(40);
        }

        if (widget.opt3 == widget.correctAns) {
          opt3Votes = Random().nextInt(50) + 50;
        } else {
          opt3Votes = Random().nextInt(40);
        }

        if (widget.opt4 == widget.correctAns) {
          opt4Votes = Random().nextInt(50) + 50;
        } else {
          opt4Votes = Random().nextInt(40);
        }
        isVoting = false;
      });
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 100, 90),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 200.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.redAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Audience Poll LifeLine",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Question : ${widget.question}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                // ignore: dead_code
                isVoting ? "Audience is Voting" : "Here are the results",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              isVoting
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: LinearProgressIndicator(),
                    )
                  : Container(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${widget.opt1}\t\t(${opt1Votes} Votes)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${widget.opt2}\t\t(${opt2Votes} Votes)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${widget.opt3}\t\t(${opt3Votes} Votes)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${widget.opt4}\t\t(${opt4Votes} Votes)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
