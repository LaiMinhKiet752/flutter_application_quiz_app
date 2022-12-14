import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/firedb.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int moneyAudiencePoll = 0;
  int moneyChangeQuestion = 0;
  int moneyFiftyFifty = 0;
  int moneyAskTheExpert = 0;

  int counterAudience = 0;
  int counterChange = 0;
  int counterFifty = 0;
  int counterAsk = 0;

  bool isBuy = true;
  void _incrementMoneyAudience() {
    setState(() {
      moneyAudiencePoll = moneyAudiencePoll + 1000;
    });
  }

  void _reduceMoneyAudience() {
    setState(() {
      if (moneyAudiencePoll == 0) {
        moneyAudiencePoll = 0;
      } else {
        moneyAudiencePoll = moneyAudiencePoll - 1000;
      }
    });
  }

  void _incrementCounterAudience() {
    setState(() {
      counterAudience++;
    });
  }

  void _reduceCounterAudience() {
    setState(() {
      if (counterAudience <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Cannot decrease more than 0"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        counterAudience--;
      }
    });
  }

  void _incrementMoneyChange() {
    setState(() {
      moneyChangeQuestion = moneyChangeQuestion + 2000;
    });
  }

  void _reduceMoneyChange() {
    setState(() {
      if (moneyChangeQuestion == 0) {
        moneyChangeQuestion = 0;
      } else {
        moneyChangeQuestion = moneyChangeQuestion - 2000;
      }
    });
  }

  void _incrementCounterChange() {
    setState(() {
      counterChange++;
    });
  }

  void _reduceCounterChange() {
    setState(() {
      if (counterChange <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Cannot decrease more than 0"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        counterChange--;
      }
    });
  }

  void _incrementMoneyFifty() {
    setState(() {
      moneyFiftyFifty = moneyFiftyFifty + 3000;
    });
  }

  void _reduceMoneyFifty() {
    setState(() {
      if (moneyFiftyFifty == 0) {
        moneyFiftyFifty = 0;
      } else {
        moneyFiftyFifty = moneyFiftyFifty - 3000;
      }
    });
  }

  void _incrementCounterFifty() {
    setState(() {
      counterFifty++;
    });
  }

  void _reduceCounterFifty() {
    setState(() {
      if (counterFifty <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Cannot decrease more than 0"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        counterFifty--;
      }
    });
  }

  void _incrementMoneyAsk() {
    setState(() {
      moneyAskTheExpert = moneyAskTheExpert + 5000;
    });
  }

  void _reduceMoneyAsk() {
    setState(() {
      if (moneyAskTheExpert == 0) {
        moneyAskTheExpert = 0;
      } else {
        moneyAskTheExpert = moneyAskTheExpert - 5000;
      }
    });
  }

  void _incrementCounterAsk() {
    setState(() {
      counterAsk++;
    });
  }

  void _reduceCounterAsk() {
    setState(() {
      if (counterAsk <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Cannot decrease more than 0"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        counterAsk--;
      }
    });
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
          "Shop",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            10.0,
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Color.fromARGB(255, 255, 191, 118),
                                Color.fromARGB(255, 227, 254, 130),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Audience Poll",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Icon(
                                Icons.people,
                                color: Colors.red,
                              ),
                              Text("Conis: 1000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _reduceCounterAudience();
                                        _reduceMoneyAudience();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/img/reduce.png"),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    isBuy
                                        ? Text('$counterAudience')
                                        : Text("0"),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementCounterAudience();
                                        _incrementMoneyAudience();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage("assets/img/add.png"),
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
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 150.0,
                      height: 150,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Color.fromARGB(255, 255, 191, 118),
                                Color.fromARGB(255, 227, 254, 130),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Change Question",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Icon(
                                Icons.change_circle,
                                color: Colors.red,
                              ),
                              Text("Conis: 2000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _reduceCounterChange();
                                        _reduceMoneyChange();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/img/reduce.png"),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    isBuy ? Text('$counterChange') : Text("0"),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementCounterChange();
                                        _incrementMoneyChange();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage("assets/img/add.png"),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Color.fromARGB(255, 255, 191, 118),
                                Color.fromARGB(255, 227, 254, 130),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Fifty Fifty",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.red,
                              ),
                              Text("Conis: 3000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _reduceCounterFifty();
                                        _reduceMoneyFifty();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/img/reduce.png"),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    isBuy ? Text('$counterFifty') : Text("0"),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementCounterFifty();
                                        _incrementMoneyFifty();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage("assets/img/add.png"),
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
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 150.0,
                      height: 150,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Color.fromARGB(255, 255, 191, 118),
                                Color.fromARGB(255, 227, 254, 130),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "ASK THE EXPERT",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                              Icon(
                                Icons.desktop_mac,
                                color: Colors.red,
                              ),
                              Text("Conis: 5000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _reduceCounterAsk();
                                        _reduceMoneyAsk();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/img/reduce.png"),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    isBuy ? Text('$counterAsk') : Text("0"),
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        _incrementCounterAsk();
                                        _incrementMoneyAsk();
                                      },
                                      child: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                          radius: 18.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage("assets/img/add.png"),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                MaterialButton(
                  color: Colors.redAccent,
                  onPressed: () {},
                  child: Container(
                    width: 200.0,
                    child: Row(
                      children: [
                        isBuy
                            ? Text(
                                "Tổng tiền: ${moneyAudiencePoll + moneyChangeQuestion + moneyFiftyFifty + moneyAskTheExpert}",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              )
                            : Text(
                                "Tổng tiền: 0",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    await FireDB.updateMoneyAfterBuyItems(
                        moneyAudiencePoll,
                        moneyChangeQuestion,
                        moneyFiftyFifty,
                        moneyAskTheExpert);
                    if (moneyAudiencePoll == 0 &&
                        moneyChangeQuestion == 0 &&
                        moneyFiftyFifty == 0 &&
                        moneyAskTheExpert == 0) {
                      print("Payment fail");
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Nothing to buy"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shop()));
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      print("Payment success");
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Payment success"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Shop()));
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Xác nhận mua",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
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
