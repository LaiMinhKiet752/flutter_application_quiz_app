import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/firedb.dart';

class Recharge extends StatefulWidget {
  const Recharge({super.key});

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  TextEditingController moneyController = TextEditingController();
  TextEditingController captchaController = TextEditingController();

  int count = 3;

  @override
  Widget build(BuildContext context) {
    String randomCaptcha = getRandomString(5);
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
          "Recharge",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 50.0,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Text("Number of times left today: "),
                      Text(count.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Top up KDV Quiz Game",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: TextField(
                    controller: moneyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintText: "Amount of money",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Captcha Code: ",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Center(
                          child: Text(
                            randomCaptcha,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: captchaController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintText: "Enter captcha code",
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  minWidth: 200.0,
                  height: 50.0,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () async {
                    if (count == 0) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("You no longer have a free deposit!"),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else if (moneyController.text == '' &&
                        captchaController.text == '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "Failed action! You have left the fields blank."),
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
                    } else if (moneyController.text != '' &&
                        captchaController.text == '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Did not enter the captcha code!"),
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
                    } else if (moneyController.text == '' &&
                        captchaController.text != '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "You have not entered the price you want to top up!"),
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
                    } else if (moneyController.text == "10000" &&
                        captchaController.text == randomCaptcha) {
                      setState(() {
                        count--;
                      });
                      await FireDB.updateMoneyAfterRecharge(10000);
                      moneyController.clear();
                      captchaController.clear();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Success!"),
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
                    } else if (moneyController.text != "10000" &&
                        captchaController.text == randomCaptcha) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              Text("You can only top up exactly 10000 Coins!"),
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
                    } else if (moneyController.text == "10000" &&
                        captchaController.text != randomCaptcha) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("You entered the wrong captcha code!"),
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
                    } else if (moneyController.text != "10000" &&
                        captchaController.text != randomCaptcha) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "You can only top up exactly 10000 Coins and you entered the wrong captcha code!"),
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
                    }
                  },
                  child: Text(
                    "Confirm",
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
