import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:quiz_app/screen/submit_app_reviews.dart';
import 'package:rating_dialog/rating_dialog.dart';

class AppReviews extends StatefulWidget {
  const AppReviews({super.key});

  @override
  State<AppReviews> createState() => _AppReviewsState();
}

class _AppReviewsState extends State<AppReviews> {
  void _showRatingDialog() async{
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
    final _dialog = RatingDialog(
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
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        if (response.rating < 3.0) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitAppReviews()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitAppReviews()));
        }
      },
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
      appBar: AppBar(title: Center(child: const Text('Rating KDV Quiz'))),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: const Text('Click here to rate'),
            onPressed: _showRatingDialog,
          ),
        ),
      ),
    );
  }
}
