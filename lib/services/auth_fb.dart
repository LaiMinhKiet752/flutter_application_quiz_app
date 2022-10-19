import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:quiz_app/services/firedb.dart';
import 'package:quiz_app/utils/showSnackbar.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final usercredential = await _auth.signInWithCredential(facebookAuthCredential);
      final User? user = usercredential.user;
      await FireDB().createNewUser(user!.displayName.toString(),
      user.email.toString(), user.photoURL.toString(), user.uid.toString());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }