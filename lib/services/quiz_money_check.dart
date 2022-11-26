import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';

class QuizMoneyCheck {
  static Future<bool> buyQuiz(
      {required int QuizPrice, required String QuizID}) async {
    String user_id = "";
    bool check_money_user = false;
    await LocalDB.getUserID().then((uID) {
      user_id = uID!;
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user_id)
        .get()
        .then((user) {
      check_money_user = QuizPrice <= user.data()!["money"];
    });

    if (check_money_user) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user_id)
          .collection("unlocked_quiz")
          .doc(QuizID)
          .set({"unlcoked_at": DateTime.now()});
      print("QUIZ IS UNLOCKED NOW");
      return true;
    } else {
      print("YOU NEED TO EARN EXTRA MONEY");
      return false;
    }
  }
}
