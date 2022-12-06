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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 350.0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/img/audio.png"),
                    title: Text(
                      "Sound",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
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
                                  content: Text("Bạn đã tắt âm thanh"),
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
                                  content: Text("Bạn đã bật âm thanh"),
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
                  child: ListTile(
                    leading: Image.asset("assets/img/phone.png"),
                    title: Text(
                      "Vibration",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
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
                                  content: Text("Bạn đã tắt chế độ rung"),
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
                                  content: Text("Bạn đã bật chế độ rung"),
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
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Music",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    leading: Image.asset("assets/img/music.png"),
                    trailing: Switch(
                      value: isMusicSwitched,
                      onChanged: (value) {
                        setState(
                          () {
                            if (isMusicSwitched == true) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("Bạn đã tắt nhạc nền"),
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
                                  content: Text("Bạn đã bật nhạc nền"),
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
                  child: ListTile(
                    leading: Image.asset("assets/img/text.png"),
                    title: Container(
                      margin: EdgeInsets.symmetric(horizontal: 17.0),
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
                Card(
                  child: ListTile(
                    title: Text(
                      "Share App",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Image.asset("assets/img/share.png"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Rate Us",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Image.asset("assets/img/star.png"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  height: 50.0,
                  minWidth: 200.0,
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
