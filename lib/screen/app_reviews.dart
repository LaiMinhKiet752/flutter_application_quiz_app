import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger/logger.dart';
import 'package:quiz_app/components.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/submit_app_reviews.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:rating_dialog/rating_dialog.dart';

class AppReviews extends StatefulWidget {
  const AppReviews({super.key});

  @override
  State<AppReviews> createState() => _AppReviewsState();
}

class _AppReviewsState extends State<AppReviews> {
  String name = '';
  getUserName() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  var logger = Logger();
  final formKey = GlobalKey<FormState>();
  void _showRatingDialog() async {
    final _inAppReview = InAppReview.instance;
    if (await _inAppReview.isAvailable()) {
      print('Request actual review from store');
      _inAppReview.requestReview();
    } else {
      print('Open actual store listing');
      _inAppReview.openStoreListing(
        appStoreId: '',
        microsoftStoreId: '',
      );
    }
    final _dialog = Form(
      key: formKey,
      child: RatingDialog(
        initialRating: 1.0,
        title: Text(
          'Rating KDV Quiz',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        // your app's logo?
        image: Image.asset("assets/img/logo_quiz.png"),
        submitButtonText: 'Submit',
        commentHint: "Enter your review",
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) async {
          if (response.comment.isNotEmpty || response.rating >= 1) {
            print('rating: ${response.rating}, comment: ${response.comment}');
            final addData = new AddReviewFireStore();
            await addData.addReviewResponse(
                response.comment, response.rating, name.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubmitAppReviews()));
          }
        },
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MaterialButton(
        height: 50.0,
        minWidth: 150.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Center(
          child: const Text('Rating KDV Quiz'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: _showRatingDialog,
            child: Image.asset(
              "assets/img/click_here_to_rating.png",
            ),
          ),
        ),
      ),
    );
  }
}
