import 'package:flutter/material.dart';
import 'package:quiz_app/screen/app_reviews.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login.dart';
import 'package:quiz_app/screen/profile.dart';
import 'package:quiz_app/services/auth_gg.dart';
import 'package:quiz_app/screen/settings_screen.dart';

// ignore: must_be_immutable
class SideNav extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Drawer(
      width: 270.0,
      child: Material(
        color: Color.fromARGB(255, 244, 116, 111),
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: name,
                              proUrl: proUrl,
                              rank: rank,
                              level: level,
                              money: money,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(proUrl),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
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
                              "Coins: $money",
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
                    child: Text(
                      "Leaderboard - $rank th Rank",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
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
            listItem(
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
              label: "Daily quiz",
              icon: Icons.quiz,
            ),
            listItem(
              context: context,
              path: MaterialPageRoute(
                  builder: (BuildContext context) => SettingsScreen()),
              label: "Settings",
              icon: Icons.settings,
            ),
            listItem(
              context: context,
              path: MaterialPageRoute(
                  builder: (BuildContext context) => AppReviews()),
              label: "App reviews",
              icon: Icons.star,
            ),
            listItem(
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
              label: "How to use",
              icon: Icons.question_answer,
            ),
            listItem(
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
              label: "Logout",
              icon: Icons.logout_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(
      {required String label,
      required IconData icon,
      required BuildContext context,
      required MaterialPageRoute path}) {
    final color = Colors.white;
    final hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      hoverColor: hovercolor,
      title: Text(
        label,
        style: TextStyle(color: color, fontSize: 15.0),
      ),
      onTap: () async {
        await signOut();
        Navigator.pushReplacement(context, path);
      },
    );
  }
}
