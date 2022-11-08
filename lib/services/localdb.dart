import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static final uidKey = "hahahahaha";
  static final lkey = "lalalalala";
  static final rkey = "hohohohoho";
  static final nkey = "hihihihihi";
  static final mkey = "hehehehehe";
  static final pkey = "iuiuiuiuiu";
  static final Audkey = "audkey123";
  static final Chankey = "chankey123";
  static final Fiftykey = "fiftykey123";
  static final ExpKey = "expkey123";


  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }

  static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mkey, money);
  }

  static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mkey);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nkey, name);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nkey);
  }

  static Future<bool> saveUrl(String prourl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pkey, prourl);
  }

  static Future<String?> getUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pkey);
  }

  static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lkey, level);
  }

  static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(lkey);
  }

  static Future<bool> saveRank(String rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rkey, rank);
  }

  static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rkey);
  }

}
