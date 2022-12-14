import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
                              Text("Conis: 5000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/reduce.png"),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text("0"),
                                    Expanded(child: Container()),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/add.png"),
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
                              Text("Conis: 5000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/reduce.png"),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text("0"),
                                    Expanded(child: Container()),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/add.png"),
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
                              Text("Conis: 5000"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/reduce.png"),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text("0"),
                                    Expanded(child: Container()),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/add.png"),
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
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/reduce.png"),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text("0"),
                                    Expanded(child: Container()),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage("assets/img/add.png"),
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
                  child: Text(
                    "Tổng tiền: 0 Coins",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                MaterialButton(
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
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
