import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/about_them.dart';
import 'package:quiz_app/screen/contact_us.dart';
import 'package:quiz_app/screen/quizintro.dart';
import 'package:quiz_app/screen/tips.dart';
import 'package:quiz_app/services/home_fire.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/widgets/sidenavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = 'User Name';
  String money = '---';
  String lead = '---';
  String proUrl = '---';
  String level = '0';

  late List quizzes;
  bool isLoading = true;
  getUserDet() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });
    await LocalDB.getMoney().then((value) {
      setState(() {
        money = value.toString();
      });
    });

    await LocalDB.getRank().then((value) {
      setState(() {
        lead = value.toString();
      });
    });

    await LocalDB.getUrl().then((value) {
      setState(() {
        proUrl = value.toString();
      });
    });

    await LocalDB.getLevel().then((value) {
      setState(() {
        level = value.toString();
      });
    });
  }

  getquiz() async {
    await HomeFire.getquizzes().then((returned_quizzes) {
      setState(() {
        quizzes = returned_quizzes;
        isLoading = false;
      });
    });
  }

  late Map<String, dynamic> TopPlayer;
  getTopPlayer() async {
    await FirebaseFirestore.instance
        .collection("users")
        .orderBy("money", descending: true)
        .get()
        .then((value) {
      setState(() {
        TopPlayer = value.docs.elementAt(0).data();
      });
    });
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
    getUserDet();
    getquiz();
    getTopPlayer();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    TextStyle colorizeTextStyle = GoogleFonts.hanaleiFill(
      fontSize: 30.0,
    );
    return isLoading
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "KDV QUIZ APP",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: LinearProgressIndicator(),
                  ),
                ],
              ),
            ),
          )
        : RefreshIndicator(
            onRefresh: () async {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 251, 100, 90),
                title: Text("KDV - Quiz Game"),
              ),
              drawer: SideNav(
                name: name,
                money: money,
                rank: lead,
                proUrl: proUrl,
                level: level,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                image: AssetImage("assets/img/banner_1.jpg"),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                image: AssetImage("assets/img/banner_2.jpg"),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                image: AssetImage("assets/img/banner_3.png"),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(
                            milliseconds: 500,
                          ),
                          viewportFraction: 0.8,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AboutThem()));
                                  },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            "assets/img/about_them.gif"),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "About them",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Tips()));
                                  },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/tips.gif"),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Tips",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ContactUs()));
                                  },
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    child: CircleAvatar(
                                      radius: 28.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            "assets/img/contact_us.gif"),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Contact us",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizIntro(
                                        QuizAbout: (quizzes[2])["about_quiz"],
                                        QuizDuration: (quizzes[2])["duration"],
                                        QuizName: (quizzes[2])["quiz_name"],
                                        QuizTopics: (quizzes[2])["topics"],
                                        QuizID: (quizzes[2])["Quizid"],
                                        QuizPrice: (quizzes[2])['unlock_money'],
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8.0,
                                      child: Container(
                                        height: 150.0,
                                        width: 180.0,
                                        child: Image.asset(
                                          "assets/img/chemistry_banner.jpg",
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizIntro(
                                        QuizAbout: (quizzes[3])["about_quiz"],
                                        QuizDuration: (quizzes[3])["duration"],
                                        QuizName: (quizzes[3])["quiz_name"],
                                        QuizTopics: (quizzes[3])["topics"],
                                        QuizID: (quizzes[3])["Quizid"],
                                        QuizPrice: (quizzes[3])['unlock_money'],
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8.0,
                                      child: Container(
                                        height: 150.0,
                                        width: 180.0,
                                        child: Image.asset(
                                          "assets/img/physical_banner.jpg",
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizIntro(
                                        QuizAbout: (quizzes[4])["about_quiz"],
                                        QuizDuration: (quizzes[4])["duration"],
                                        QuizName: (quizzes[4])["quiz_name"],
                                        QuizTopics: (quizzes[4])["topics"],
                                        QuizID: (quizzes[4])["Quizid"],
                                        QuizPrice: (quizzes[4])['unlock_money'],
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8.0,
                                      child: Container(
                                        height: 150.0,
                                        width: 180.0,
                                        child: Image.asset(
                                          "assets/img/toan_banner.jpg",
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuizIntro(
                                        QuizAbout: (quizzes[5])["about_quiz"],
                                        QuizDuration: (quizzes[5])["duration"],
                                        QuizName: (quizzes[5])["quiz_name"],
                                        QuizTopics: (quizzes[5])["topics"],
                                        QuizID: (quizzes[5])["Quizid"],
                                        QuizPrice: (quizzes[5])['unlock_money'],
                                      ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8.0,
                                      child: Container(
                                        height: 150.0,
                                        width: 180.0,
                                        child: Image.asset(
                                          "assets/img/literary_banner.jpg",
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              totalRepeatCount: 1000,
                              animatedTexts: [
                                TyperAnimatedText(
                                  "Richest Player In The World",
                                  textStyle: GoogleFonts.zenDots(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        child: Image.asset(
                                          "assets/img/fire.gif",
                                          width: 50.0,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        child: Image.asset(
                                          "assets/img/fire.gif",
                                          width: 50.0,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 110.0,
                                      height: 100.0,
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.yellowAccent,
                                          width: 2.0,
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            TopPlayer["photoUrl"],
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 255, 132, 0),
                                            blurRadius: 2.0,
                                            spreadRadius: 2.0,
                                            offset: Offset(-1.0, 1.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedTextKit(
                                      totalRepeatCount: 1000,
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          TopPlayer["name"].toString().length >=
                                                  16
                                              ? "${TopPlayer["name"].toString().substring(0, 15)}..."
                                              : TopPlayer["name"],
                                          textStyle: colorizeTextStyle,
                                          colors: colorizeColors,
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                    AnimatedTextKit(
                                      totalRepeatCount: 1000,
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          "Coins: ${money_generator(int.parse(TopPlayer["money"].toString()))}",
                                          textStyle: colorizeTextStyle,
                                          colors: colorizeColors,
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20.0),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1000,
                                animatedTexts: [
                                  WavyAnimatedText("General Question",
                                      textStyle: GoogleFonts.zenDots(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                      speed: const Duration(milliseconds: 200)),
                                ],
                                isRepeatingAnimation: true,
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 5.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuizIntro(
                                              QuizAbout:
                                                  (quizzes[0])["about_quiz"],
                                              QuizDuration:
                                                  (quizzes[0])["duration"],
                                              QuizName:
                                                  (quizzes[0])["quiz_name"],
                                              QuizTopics:
                                                  (quizzes[0])["topics"],
                                              QuizID: (quizzes[0])["Quizid"],
                                              QuizPrice:
                                                  (quizzes[0])['unlock_money'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Card(
                                            elevation: 10.0,
                                            child: Container(
                                              height: 150.0,
                                              width: 180.0,
                                              child: Image.network(
                                                "https://images.unsplash.com/photo-1599508704512-2f19efd1e35f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuizIntro(
                                              QuizAbout:
                                                  (quizzes[1])["about_quiz"],
                                              QuizDuration:
                                                  (quizzes[1])["duration"],
                                              QuizName:
                                                  (quizzes[1])["quiz_name"],
                                              QuizTopics:
                                                  (quizzes[1])["topics"],
                                              QuizID: (quizzes[1])["Quizid"],
                                              QuizPrice:
                                                  (quizzes[1])['unlock_money'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Card(
                                            elevation: 10.0,
                                            child: Container(
                                              height: 150.0,
                                              width: 180.0,
                                              child: Image.network(
                                                "https://images.unsplash.com/photo-1599508704512-2f19efd1e35f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'v1.0 Made By KDV Company',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
