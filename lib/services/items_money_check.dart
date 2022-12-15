import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';

class ItemMoneyCheck {
  static Future<bool> buyItem(
      {required int Item1Price,
      required int Item2Price,
      required int Item3Price,
      required int Item4Price}) async {
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
      check_money_user = (Item1Price + Item2Price + Item3Price + Item4Price) <=
          user.data()!["money"];
    });

    if (check_money_user) {
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random _rnd = Random();

      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      await FirebaseFirestore.instance
          .collection("history")
          .doc("purchase_history")
          .collection("user")
          .doc(user_id)
          .set({
        "code_orders": getRandomString(5),
        "buy_at": DateTime.now(),
        "coins": (Item1Price + Item2Price + Item3Price + Item4Price).toString()
      });
      return true;
    } else {
      return false;
    }
  }
}
