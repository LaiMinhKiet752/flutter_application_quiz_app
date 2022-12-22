import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/services/firedb.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/utils/showSnackbar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookAuth facebookSignIn = FacebookAuth.instance;
// ignore: body_might_complete_normally_nullable
Future<User?> signInWithGoogle() async {
  final GoogleSignInAccount? googlesignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googlesignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  final usercredential = await _auth.signInWithCredential(credential);
  final User? user = usercredential.user;

  assert(!user!.isAnonymous);
  // ignore: unnecessary_null_comparison
  assert(await user!.getIdToken() != null);

  final User? currentUser = _auth.currentUser;
  assert(currentUser!.uid == user!.uid);
  await FireDB().createNewUser(user!.displayName.toString(),
      user.email.toString(), user.photoURL.toString(), user.uid.toString());
  await LocalDB.saveUserID(user.uid);
  await LocalDB.saveName(user.displayName.toString());
  await LocalDB.saveUrl(user.photoURL.toString());
  print(user);
}

Future<void> signInWithFacebook(BuildContext context) async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final usercredential =
        await _auth.signInWithCredential(facebookAuthCredential);
    final User? user = usercredential.user;
    await FireDB().createNewUser(user!.displayName.toString(),
        user.email.toString(), user.photoURL.toString(), user.uid.toString());
    await LocalDB.saveUserID(user.uid);
    await LocalDB.saveName(user.displayName.toString());
    await LocalDB.saveUrl(user.photoURL.toString());
    print(user);
  } on FirebaseAuthException catch (e) {
    showSnackBar(context, e.message!);
  }
}

Future<String> signOutGoogleAndFacebook() async {
  if (googleSignIn.currentUser != null) {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    await _auth.signOut();
    await LocalDB.saveUserID("null");
    print("Signed Out");
  } else {
    // await facebookSignIn.logOut();
    await _auth.signOut();
    await LocalDB.saveUserID("null");
    print("Signed Out");
  }

  return "SUCCESS";
}
