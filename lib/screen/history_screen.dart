import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/localdb.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatefulWidget {
  late String code;
  late String money;
  late Timestamp buy_at;
  HistoryScreen(
      {super.key,
      required this.code,
      required this.money,
      required this.buy_at});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String name = '';
  String proUrl = '';
  getUserInfo() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });

    await LocalDB.getUrl().then((value) {
      setState(() {
        proUrl = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text(
          "Most recent purchase history",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 100.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10.0),
            height: 400.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: Image.asset("assets/img/logo_quiz.png"),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "INVOICE",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Invoice #: ${widget.code}",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 120.0,
                              child: Text(
                                "Place: 65 Huynh Thuc Khang, Ben Nghe Ward, District 1, Ho Chi Minh City",
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 5.0,
                  endIndent: 5.0,
                  thickness: 2.0,
                  color: Colors.grey,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Provided by:",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("KDV QUIZ COMPANY"),
                            Text("65 Huynh Thuc Khang"),
                            Text("Ben Nghe Ward"),
                            Text("District 1"),
                            Text("Ho Chi Minh City"),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Provided to:",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(fontSize: 18.0),
                            ),
                            CircleAvatar(
                              radius: 29.0,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 28.0,
                                backgroundImage: proUrl.isNotEmpty
                                    ? NetworkImage(proUrl)
                                    : null,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("DESCRIPTION"),
                      ),
                      Container(
                        child: Text("Created_at"),
                      ),
                      Container(
                        child: Text("Total Coins"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.0,
                        child: Text("Payment of game items"),
                      ),
                      Container(
                        width: 100.0,
                        child: Text("${widget.buy_at.toDate().toString()}"),
                      ),
                      Container(
                        child: Text("${widget.money} Coins"),
                      ),
                    ],
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
