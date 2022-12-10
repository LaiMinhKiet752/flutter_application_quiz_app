import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isAudioSwitched = false;
  bool isPhoneSwitched = false;
  bool isMusicSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 350.0,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/img/audio.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                      title: Container(
                        margin: EdgeInsets.only(
                          left: 50.0,
                        ),
                        child: Text(
                          "Sound",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: Switch(
                        value: isAudioSwitched,
                        onChanged: (value) {
                          setState(
                            () {
                              if (isAudioSwitched == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You turned off the sound",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isAudioSwitched = value;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You turned on the sound",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isAudioSwitched = value;
                              }
                            },
                          );
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/img/phone.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        width: 80.0,
                      ),
                      title: Container(
                        margin: EdgeInsets.only(
                          left: 28.0,
                        ),
                        child: Text(
                          "Vibration",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: Switch(
                        value: isPhoneSwitched,
                        onChanged: (value) {
                          setState(
                            () {
                              if (isPhoneSwitched == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You have turned off vibration mode",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isPhoneSwitched = value;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You've turned on vibrate mode",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isPhoneSwitched = value;
                              }
                            },
                          );
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          margin: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Music",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      leading: Image.asset(
                        "assets/img/music.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                      trailing: Switch(
                        value: isMusicSwitched,
                        onChanged: (value) {
                          setState(
                            () {
                              if (isMusicSwitched == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You turned off the background music",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isMusicSwitched = value;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text(
                                      "You turned on the background music",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                                isMusicSwitched = value;
                              }
                            },
                          );
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/img/text.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                      title: Container(
                        margin: EdgeInsets.symmetric(horizontal: 17.0),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 50.0,
                          ),
                          child: Text(
                            "Font Size",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(
                          left: 50.0,
                        ),
                        child: Text(
                          "Share App",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      leading: Image.asset(
                        "assets/img/share.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.0,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(
                          left: 65.0,
                        ),
                        child: Text(
                          "Help and FQA",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      leading: Image.asset(
                        "assets/img/help_and_fqa.png",
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Color.fromARGB(255, 251, 100, 90),
                    child: Text(
                      "Back to Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      await Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  SizedBox(
                    height: 70.0,
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
        ],
      ),
    );
  }
}
