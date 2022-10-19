import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static final uidKey = "QTwd10kBSYQ19r4Rb7FNHsFvTPC3";
  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }
}
