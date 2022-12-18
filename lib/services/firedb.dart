import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/services/localdb.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? current_user = _auth.currentUser;
    if (await getUser()) {
      print("USER ALREADY EXISTS");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user!.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "money": 50000,
        "rank": "NA",
        "level": "0"
      }).then((value) async {
        await LocalDB.saveMoney("50000");
        await LocalDB.saveRank("NA");
        await LocalDB.saveLevel("0");
        print("User Registered Successfully");
      });
    }
  }

  static updateMoney(int amount) async {
    if (amount != 2500) {
      final FirebaseAuth _myauth = FirebaseAuth.instance;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_myauth.currentUser!.uid)
          .get()
          .then((value) async {
        await LocalDB.saveMoney((value.data()!["money"] + amount).toString());
        await FirebaseFirestore.instance
            .collection("users")
            .doc(_myauth.currentUser!.uid)
            .update({"money": value.data()!["money"] + amount});
      });
    }
  }

  static updateMoneyAfterBuyQuiz(int amount) async {
    if (amount != 2500) {
      final FirebaseAuth _myauth = FirebaseAuth.instance;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_myauth.currentUser!.uid)
          .get()
          .then((value) async {
        await LocalDB.saveMoney((value.data()!["money"] - amount).toString());
        await FirebaseFirestore.instance
            .collection("users")
            .doc(_myauth.currentUser!.uid)
            .update({"money": value.data()!["money"] - amount});
      });
    }
  }

  static updateMoneyAfterBuyItems(
      int item1, int item2, int item3, int item4) async {
    final FirebaseAuth _myauth = FirebaseAuth.instance;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(_myauth.currentUser!.uid)
        .get()
        .then((value) async {
      await LocalDB.saveMoney(
          (value.data()!["money"] - item1 - item2 - item3 - item4).toString());
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_myauth.currentUser!.uid)
          .update({
        "money": value.data()!["money"] - item1 - item2 - item3 - item4
      });
    });
  }

  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user!.uid)
        .get()
        .then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveMoney("50000");
      await LocalDB.saveRank("100");
      await LocalDB.saveLevel("1");
    });
    if (user.toString() == "null") {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user.uid)
          .get()
          .then((value) async {
        user = value.data().toString();
        print(user);
        await LocalDB.saveMoney(value["money"].toString());
        await LocalDB.saveRank(value["rank"]);
        await LocalDB.saveLevel(value["level"]);
      });
      return true;
    }
  }
}
