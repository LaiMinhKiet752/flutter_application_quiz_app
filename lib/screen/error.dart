import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Looser extends StatelessWidget {
  late int wonMon;
  late String correctAns;
  Looser({required this.wonMon, required this.correctAns});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/win.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Retry"),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Unfortunately!",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "YOUR ANSWER IS INCORRECT",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "CORRECT ANSWER IS ${correctAns}",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "You Won",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Coins: ${wonMon == 2500 ? 0 : wonMon}",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.asset(
                  "assets/img/error.png",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                child: Text("Go To Rewards"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
