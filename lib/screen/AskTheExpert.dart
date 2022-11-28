import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class AskTheExpert extends StatefulWidget {
  late String question;
  late String ytURL;
  AskTheExpert({required this.question, required this.ytURL});

  @override
  State<AskTheExpert> createState() => _AskTheExpertState();
}

class _AskTheExpertState extends State<AskTheExpert> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 20), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 100, 90),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 200.0, horizontal: 30.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ASK THE EXPERT LIFELINE",
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "QUESTION : ${widget.question} ",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: widget.ytURL, //Add videoID.
                    flags: YoutubePlayerFlags(
                      hideControls: true,
                      controlsVisibleAtStart: false,
                      autoPlay: true,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
              ),
              Text(
                "You Will Be Redirected To Quiz Screen In 20 Seconds.",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
