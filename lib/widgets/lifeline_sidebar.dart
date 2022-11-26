import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/screen/AudiencePoll.dart';
import 'package:quiz_app/services/localdb.dart';

// ignore: must_be_immutable
class LifeLine_Drawer extends StatefulWidget {
  late String question;
  late String opt1;
  late String opt2;
  late String opt3;
  late String opt4;
  late String correctAns;
  LifeLine_Drawer(
      {required this.question,
      required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<LifeLine_Drawer> createState() => _LifeLine_DrawerState();
}

class _LifeLine_DrawerState extends State<LifeLine_Drawer> {
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
    bool FyftyAvail = true;
    await LocalDB.getFifty().then((value) {
      FyftyAvail = value!;
    });
    return FyftyAvail;
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
                      print("AUDIENCE POLL IS ALREADY USED");
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
                            color: Colors.redAccent,
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
                            color: Colors.black54,
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
                Column(
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
                          color: Colors.redAccent,
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
                Column(
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
                          color: Colors.redAccent,
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
                      return ListTile(
                        leading: Text(
                          "${index + 1}.",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        title: Text(
                          "Coins: ${2500 * (pow(2, index + 1))}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
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
