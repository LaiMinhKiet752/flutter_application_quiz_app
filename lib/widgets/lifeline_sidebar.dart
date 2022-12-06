import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/AskTheExpert.dart';
import 'package:quiz_app/screen/AudiencePoll.dart';
import 'package:quiz_app/screen/Fifty50.dart';
import 'package:quiz_app/screen/question.dart';
import 'package:quiz_app/services/localdb.dart';

// ignore: must_be_immutable
class LifeLine_Drawer extends StatefulWidget {
  late String question;
  late String quizID;
  late String opt1;
  late String opt2;
  late String opt3;
  late String opt4;
  late String correctAns;
  late int currentQueMon;
  LifeLine_Drawer({
    required this.question,
    required this.quizID,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.correctAns,
    required this.currentQueMon,
  });

  @override
  State<LifeLine_Drawer> createState() => _LifeLine_DrawerState();
}

class _LifeLine_DrawerState extends State<LifeLine_Drawer> {
  bool audience = true;
  bool chanques = true;
  bool fifty50 = true;
  bool exp = true;
  Future<bool> checkAudAvail() async {
    bool AudAvail = true;
    await LocalDB.getAud().then((value) {
      AudAvail = value!;
    });
    return AudAvail;
  }

  Future<bool> checkChanAvail() async {
    bool ChanAvail = true;
    await LocalDB.getChan().then((value) {
      ChanAvail = value!;
    });
    return ChanAvail;
  }

  Future<bool> checkFiftyAvail() async {
    bool FiftyAvail = true;
    await LocalDB.getFifty().then((value) {
      FiftyAvail = value!;
    });
    return FiftyAvail;
  }

  Future<bool> checkExpAvail() async {
    bool ExpAvail = true;
    await LocalDB.getExp().then((value) {
      ExpAvail = value!;
    });
    return ExpAvail;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "LifeLine",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    if (await checkAudAvail()) {
                      await LocalDB.saveAud(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudiencePoll(
                            question: widget.question,
                            opt1: widget.opt1,
                            opt2: widget.opt2,
                            opt3: widget.opt3,
                            opt4: widget.opt4,
                            correctAns: widget.correctAns,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        audience = false;
                      });
                      print("AUDIENCE POLL IS ALREADY USED");
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("AUDIENCE POLL IS ALREADY USED!"),
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
                  child: Column(
                    children: [
                      Card(
                        elevation: 12.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: audience ? Colors.redAccent : Colors.grey,
                          ),
                          child: Icon(
                            Icons.people,
                            size: 32.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Audience\n Poll",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (await checkChanAvail()) {
                      await LocalDB.saveChan(false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(
                                  quizID: widget.quizID,
                                  queMoney: widget.currentQueMon)));
                    } else {
                      setState(() {
                        chanques = false;
                      });
                      print("CHANGE QUESTIONS IS ALREADY USED");
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("CHANGE QUESTIONS IS ALREADY USED!"),
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
                  child: Column(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: chanques ? Colors.redAccent : Colors.grey,
                          ),
                          child: Icon(
                            Icons.change_circle,
                            size: 32.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Change\n Questions",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (await checkFiftyAvail()) {
                      await LocalDB.saveFifty(false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Fifty50(
                                    opt1: widget.opt1,
                                    opt2: widget.opt2,
                                    opt3: widget.opt3,
                                    opt4: widget.opt4,
                                    correctAns: widget.correctAns,
                                  )));
                    } else {
                      setState(() {
                        fifty50 = false;
                      });
                      print("FIFTY 50 IS ALREADY USED");
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("FIFTY 50 IS ALREADY USED!"),
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
                  child: Column(
                    children: [
                      Card(
                        elevation: 12.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: fifty50 ? Colors.redAccent : Colors.grey,
                          ),
                          child: Icon(
                            Icons.star_half,
                            size: 32.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Fifty\n Fifty",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (await checkExpAvail()) {
                      String ytUrl = "";
                      await FirebaseFirestore.instance
                          .collection("quizzes")
                          .doc(widget.quizID)
                          .collection("questions")
                          .where("question", isEqualTo: widget.question)
                          .get()
                          .then((value) async {
                        print("ASK THE EXPERT HERE");
                        print(widget.quizID);
                        print(widget.question);
                        value.docs.forEach((element) {
                          print("YT LINK IS HERE");
                          print(element.data()["AnswerYTLinkID"]);
                          ytUrl = element.data()["AnswerYTLinkID"];
                        });
                        print(value.docs.elementAt(0).data()["AnswerYTLinkID"]);
                        await LocalDB.saveExp(false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AskTheExpert(
                                    question: widget.question, ytURL: ytUrl)));
                      });
                    } else {
                      setState(() {
                        exp = false;
                      });
                      print("ASK THE EXPERT IS ALREADY USED");
                      return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("ASK THE EXPERT IS ALREADY USED!"),
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
                  child: Column(
                    children: [
                      Card(
                        elevation: 12.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: exp ? Colors.redAccent : Colors.grey,
                          ),
                          child: Icon(
                            Icons.desktop_mac,
                            size: 32.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Ask The\n Expert",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              color: Colors.black26,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "PRIZES",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 500.0,
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      if (2500 * (pow(2, index + 1)) == widget.currentQueMon) {
                        return ListTile(
                          tileColor: Colors.deepPurpleAccent,
                          leading: Text(
                            "${index + 1}.",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          title: Text(
                            "Coins: ${2500 * (pow(2, index + 1))}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20.0),
                          ),
                          trailing: Icon(
                            Icons.circle,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                      return ListTile(
                        leading: Text(
                          "${index + 1}.",
                          style: TextStyle(fontSize: 17.0, color: Colors.grey),
                        ),
                        title: Text(
                          "Coins: ${2500 * (pow(2, index + 1))}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        trailing: Icon(Icons.circle),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
