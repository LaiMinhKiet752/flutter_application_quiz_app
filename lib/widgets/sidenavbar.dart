import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270.0,
      child: Material(
        color: Color.fromARGB(255, 244, 116, 111),
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Minh Kiet",
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
                      "Coins: 50,000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Leaderboard - 100th Rank",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            listItem(
              label: "DAILY QUIZ",
              icon: Icons.quiz,
            ),
            listItem(
              label: "Leaderboard",
              icon: Icons.leaderboard,
            ),
            listItem(
              label: "How to use",
              icon: Icons.question_answer,
            ),
            listItem(
              label: "About us",
              icon: Icons.face_retouching_natural_sharp,
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon,
  }) {
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
        style: TextStyle(color: color),
      ),
      onTap: () {},
    );
  }
}
