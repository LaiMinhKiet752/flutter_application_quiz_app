import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/services/auth_fb.dart';
import 'package:quiz_app/services/auth_gg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      if (connected) {
        showSimpleNotification(Text("CONNECTED TO INTERNET"),
            background: Colors.green, trailing: Icon(Icons.check));
      } else {
        showSimpleNotification(Text("NO INTERNET"),
            background: Colors.red, trailing: Icon(Icons.warning));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 124, 124),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                "assets/img/logo_quiz.png",
                width: 380.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Welcome \n To KDV Quiz App",
                style: GoogleFonts.ibmPlexMono(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100.0,
              ),
              SignInButton(
                Buttons.FacebookNew,
                elevation: 5.0,
                onPressed: () async {
                  signInWithFacebook(context);
                },
              ),
              Text(
                "Or",
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SignInButton(
                Buttons.Google,
                elevation: 5.0,
                onPressed: () async {
                  await signInWithGoogle();
                },
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "By Continuing, You Are Agree With Our Policy and Terms",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
