import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getUserDet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text("KDV - Quiz Game"),
      ),
      drawer: SideNav(name: name, money: money, rank: lead, proUrl: proUrl, level: level,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
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
                    milliseconds: 800,
                  ),
                  viewportFraction: 0.8,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            bottom: 3,
                            left: 3,
                            right: 3,
                            child: Container(
                              color: Colors.black38,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.lock,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Coins: 53.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Flutter Quiz",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
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
              Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            bottom: 3,
                            left: 3,
                            right: 3,
                            child: Container(
                              color: Colors.black38,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.lock,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Coins: 53.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Flutter Quiz",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Stack(
                  children: [
                    Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150.0,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8eW91dHViZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 3,
                      bottom: 3,
                      left: 3,
                      right: 3,
                      child: Container(
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            Text(
                              "Coins: 53.000",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Flutter Quiz",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
