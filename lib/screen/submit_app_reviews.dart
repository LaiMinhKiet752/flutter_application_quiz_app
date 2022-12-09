import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';

class SubmitAppReviews extends StatefulWidget {
  const SubmitAppReviews({super.key});

  @override
  State<SubmitAppReviews> createState() => _SubmitAppReviewsState();
}

class _SubmitAppReviewsState extends State<SubmitAppReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                "assets/img/success_review.png",
                filterQuality: FilterQuality.high,
              ),
            ),
            Container(
              child: MaterialButton(
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
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
