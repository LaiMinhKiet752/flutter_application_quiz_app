import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_app/services/friends_object.dart';

class FriendProvider {
  //lay danh sach du lieu tu json
  static Future<List<dynamic>> readJsonData() async {
    //dung rootBundle de doc file tu resource ung dung
    var jsonText = await rootBundle.loadString('data/friends.json');
    //lay du lieu tu json (theo cau truc chua danh sach)
    var data = json.decode(jsonText);
    return data['friends'];
  }

  //lay danh sach lien he
  static Future<List<FriendObject>> getAllContacts() async {
    List<FriendObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => FriendObject.fromJson(e)).toList();
    return lsResult;
  }

  //Tim kiem theo ten hoac SDT
  static Future<List<FriendObject>> searchContact(String strSearch) async {
    List<FriendObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    data.forEach((element) {
      FriendObject con = FriendObject.fromJson(element);
      if (con.name.toUpperCase().contains(strSearch.toUpperCase()) ||
          con.phone.contains(strSearch)) {
        lsResult.add(con);
      }
    });
    return lsResult;
  }
}
