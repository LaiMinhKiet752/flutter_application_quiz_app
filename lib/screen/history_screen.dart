import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';

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
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text("Code orders: ${widget.code}"),
              subtitle: Text(widget.buy_at.toDate().toString()),
              trailing: Text("Conis: ${widget.money}"),
            ),
          ),
        ),
      ),
    );
  }
}
