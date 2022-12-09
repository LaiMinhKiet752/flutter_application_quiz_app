import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/edit_profile.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/localdb.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  String name;
  String proUrl;
  String rank;
  String level;
  String money;
  Profile(
      {super.key,
      required this.name,
      required this.proUrl,
      required this.level,
      required this.rank,
      required this.money});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var colors = [
    Color.fromARGB(255, 255, 230, 0),
    Color.fromARGB(255, 0, 225, 255),
    Color.fromARGB(255, 255, 153, 0),
  ];
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> LeadersList;
  getLeaders() async {
    await FirebaseFirestore.instance
        .collection("users")
        .orderBy("money")
        .get()
        .then((value) {
      setState(() {
        LeadersList = value.docs.reversed.toList();
        widget.rank = (LeadersList.indexWhere(
                    (element) => element.data()["name"] == widget.name) +
                1)
            .toString();
      });
    });
    await LocalDB.saveRank(widget.rank);
  }

  String money_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)}K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)}K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)}M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)}B";
    } else {
      return num.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getLeaders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_add),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.0),
              height: 260.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 100, 90),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.proUrl),
                        radius: 50.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_Profile()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.edit,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${widget.name}\nCoins: ${money_generator(int.parse(widget.money))}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    thickness: 1.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    color: Colors.black26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "#${widget.rank}",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          Text(
                            "Rank",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/img/award.png"),
                SizedBox(
                  width: 10.0,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText(
                      'Leaderboard',
                      textStyle: GoogleFonts.zenDots(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                Image.asset("assets/img/award.png"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              height: 350.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 157, 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                LeadersList[index].data()["photoUrl"]),
                            radius: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            LeadersList[index]
                                        .data()["name"]
                                        .toString()
                                        .length >=
                                    12
                                ? "${(LeadersList[index].data()["name"]).toString().substring(0, 12)}..."
                                : (LeadersList[index].data()["name"])
                                    .toString(),
                            style: TextStyle(
                              color: colors[index],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      leading: Text(
                        "#${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "Coins: ${money_generator(int.parse(LeadersList[index].data()["money"].toString()))}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        thickness: 2.0,
                        color: Colors.black26,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                  itemCount: LeadersList.length),
            ),
          ],
        ),
      ),
    );
  }
}
