import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login_page.dart';
import 'package:quiz_app/screen/register_page.dart';
import 'package:quiz_app/services/auth.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/background.gif"),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 300.0,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/img/logo_quiz.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    width: 100.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/img/welcome_quiz.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    width: 50.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Color.fromARGB(255, 191, 0, 255),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                      ),
                      Expanded(child: Container()),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Color.fromARGB(255, 3, 194, 3),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Or",
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SignInButton(
                  Buttons.FacebookNew,
                  elevation: 5.0,
                  onPressed: () async {
                    signInWithFacebook(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()));
                  },
                ),
                SignInButton(
                  Buttons.Google,
                  elevation: 5.0,
                  onPressed: () async {
                    await signInWithGoogle();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()));
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
      ),
    );
  }
}
