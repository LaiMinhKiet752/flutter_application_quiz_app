// ignore: unused_import
import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/app_reviews.dart';
import 'package:quiz_app/screen/daily_quiz.dart';
import 'package:quiz_app/screen/history_screen.dart';
import 'package:quiz_app/screen/how_to_use.dart';
import 'package:quiz_app/screen/list_rank.dart';
import 'package:quiz_app/screen/login.dart';
import 'package:quiz_app/screen/profile.dart';
import 'package:quiz_app/screen/recharge.dart';
import 'package:quiz_app/screen/settings_screen.dart';
import 'package:quiz_app/screen/shop.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/home_fire.dart';

// ignore: must_be_immutable
class SideNav extends StatefulWidget {
  String name;
  String money;
  String rank;
  String proUrl;
  String level;
  SideNav(
      {super.key,
      required this.name,
      required this.money,
      required this.rank,
      required this.proUrl,
      required this.level});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  late List history;

  gethistory() async {
    await HomeFire.gethistory().then((returned_history) {
      setState(() {
        history = returned_history;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    gethistory();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return Drawer(
      width: 270.0,
      child: Material(
        color: Color.fromARGB(255, 244, 116, 111),
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            GestureDetector(
              onTap: () async {
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      name: widget.name,
                      proUrl: widget.proUrl,
                      rank: widget.rank,
                      level: widget.level,
                      money: widget.money,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32.0,
                          backgroundColor: Colors.yellow,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: widget.proUrl.isNotEmpty
                                ? NetworkImage(widget.proUrl)
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Coins: ${widget.money}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Text(
                          "Leaderboard - ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText(
                              '${widget.rank} th Rank',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.quiz,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Daily quiz",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DailyQuiz()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Your friends",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RankList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Shop",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Shop()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.attach_money_outlined,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Recharge",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Recharge()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Purchase history",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HistoryScreen(
                      code: (history[0])["code_orders"],
                      buy_at: (history[0])["buy_at"],
                      money: (history[0]["coins"]),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SettingsScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Rate us",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AppReviews()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "How to use",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HowToUse()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              onTap: () async {
                await signOutGoogleAndFacebook();
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
