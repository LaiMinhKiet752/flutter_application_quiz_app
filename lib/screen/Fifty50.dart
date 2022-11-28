import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Fifty50 extends StatefulWidget {
  late String opt1;
  late String opt2;
  late String opt3;
  late String opt4;
  late String correctAns;
  Fifty50(
      {required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  _Fifty50State createState() => _Fifty50State();
}

class _Fifty50State extends State<Fifty50> {
  late String WrongOpt1;
  late String WrongOpt2;
  List WrongOption = [];
  fetchWrongOptions() {
    setState(() {
      if (widget.opt1 != widget.correctAns) {
        WrongOption.add(widget.opt1);
      }
      if (widget.opt2 != widget.correctAns) {
        WrongOption.add(widget.opt2);
      }

      if (widget.opt3 != widget.correctAns) {
        WrongOption.add(widget.opt3);
      }
      if (widget.opt4 != widget.correctAns) {
        WrongOption.add(widget.opt4);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWrongOptions();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 100, 90),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FIFTY 50 LIFELINE",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "${WrongOption[0]} AND ${WrongOption[1]}  IS INCORRECT OPTIONS",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                "You Will Be Automatically Redirected To Quiz Screen In 5 Seconds.",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
