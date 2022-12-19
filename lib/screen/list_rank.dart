import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/list_friend_page.dart';
import 'package:quiz_app/screen/list_request_friend.dart';

class RankList extends StatefulWidget {
  RankList({super.key});

  @override
  State<RankList> createState() => _RankListState();
}

class _RankListState extends State<RankList> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestFriend()));
            },
            icon: Icon(Icons.message_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Friend_List()));
            },
            icon: Icon(Icons.person),
          )
        ],
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text(
          "Make a new Friend",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('friend')
            .where('friend_1', isEqualTo: _auth.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final listData = snapshot.data!.docs;
            List<Map<String, String>> listFriend = [];
            for (var row in listData) {
              final r = row.data() as Map<String, dynamic>;
              Map<String, String> Friend = {
                'friend_1': r['friend_1'],
                'friend_2': r['friend_2'],
                'friend_name_1': r['friend_name_1'],
                'friend_name_2': r['friend_name_2'],
              };
              listFriend.add(Friend);
            }
            Map<String, String> tempUser = {};
            return SafeArea(
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('users').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.docs;
                    List<Map<String, String>> users = [];
                    for (var row in data) {
                      final r = row.data() as Map<String, dynamic>;
                      Map<String, String> user = {
                        'email': r['email'],
                        'name': r['name'],
                        'status': 'true',
                      };

                      if (_auth.currentUser!.email ==
                          (user)['email'].toString()) {
                        tempUser = user;
                      }
                      for (var item in listFriend) {
                        if (user['email'] == item['friend_2']) {
                          user['status'] = 'false';
                        }
                      }
                      users.add(user);
                    }
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text((users[index])['name']
                                    .toString()
                                    .substring(0, 1))),
                            title: Text((users[index])['name'].toString()),
                            subtitle: Text((users[index])['email'].toString()),
                            trailing: (((user!.email !=
                                        (users[index])['email'].toString() &&
                                    (users[index])['status'].toString() ==
                                        'true')
                                ? IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Notify'),
                                          content: Text('Friend Confirmation?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                if (user.email !=
                                                    (users[index])['email']
                                                        .toString()) {
                                                  _firestore
                                                      .collection(
                                                          'friend_request')
                                                      .add({
                                                    'friend_1':
                                                        tempUser['email'],
                                                    'friend_2':
                                                        (users[index])['email']
                                                            .toString(),
                                                    'friend_name_1':
                                                        tempUser['name'],
                                                    'friend_name_2':
                                                        (users[index])['name']
                                                            .toString(),
                                                    'content': (tempUser['name']
                                                            .toString() +
                                                        ' friend request'),
                                                  });
                                                }
                                                Navigator.pop(context);
                                              },
                                              child: Text(user.email !=
                                                      (users[index])['email']
                                                          .toString()
                                                  ? 'OK'
                                                  : ''),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel')),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Text(''))),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No Data Found'),
                    );
                  }
                },
              ),
            );
          } else {
            return Center(
              child: Text('No Data Found'),
            );
          }
        },
      )),
    );
  }
}
