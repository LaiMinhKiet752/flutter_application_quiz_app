import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';

class RequestFriend extends StatefulWidget {
  const RequestFriend({super.key});

  @override
  State<RequestFriend> createState() => _RequestFriendState();
}

class _RequestFriendState extends State<RequestFriend> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              await Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          backgroundColor: Color.fromARGB(255, 251, 100, 90),
          title: Text(
            "Friend request",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: FutureBuilder<QuerySnapshot>(
            future: _firestore
                .collection('friend_request')
                .where('friend_2', isEqualTo: _auth.currentUser!.email)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!.docs;
                List<Map<String, String>> users = [];
                for (var row in data) {
                  final r = row.data() as Map<String, dynamic>;
                  Map<String, String> user = {
                    'friend_1': r['friend_1'],
                    'friend_2': r['friend_2'],
                    'content': r['content'],
                    'friend_name_1': r['friend_name_1'],
                    'friend_name_2': r['friend_name_2'],
                  };
                  users.add(user);
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Text((users[index])['friend_name_1']
                                .toString()
                                .substring(0, 1))),
                        title: Text((users[index])['friend_name_1'].toString()),
                        subtitle: Text((users[index])['content'].toString()),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Notify'),
                              content: Text('Friend Confirmation?'),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      await _firestore
                                          .collection('friend')
                                          .add({
                                        'friend_1': (users[index])['friend_1']
                                            .toString(),
                                        'friend_2': (users[index])['friend_2']
                                            .toString(),
                                        'friend_name_1':
                                            (users[index])['friend_name_1']
                                                .toString(),
                                        'friend_name_2':
                                            (users[index])['friend_name_2']
                                                .toString(),
                                      });
                                      await _firestore
                                          .collection('friend')
                                          .add({
                                        'friend_1': (users[index])['friend_2']
                                            .toString(),
                                        'friend_2': (users[index])['friend_1']
                                            .toString(),
                                        'friend_name_1':
                                            (users[index])['friend_name_2']
                                                .toString(),
                                        'friend_name_2':
                                            (users[index])['friend_name_1']
                                                .toString(),
                                      });

                                      await _firestore
                                          .runTransaction((transaction) async {
                                        await transaction.delete(snapshot
                                            .data!.docs[index].reference);
                                      });
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      await Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RequestFriend()));
                                    },
                                    child: Text('Accept')),
                                TextButton(
                                    onPressed: () async {
                                      await _firestore
                                          .runTransaction((transaction) async {
                                        await transaction.delete(snapshot
                                            .data!.docs[index].reference);
                                      });
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      await Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RequestFriend()));
                                    },
                                    child: Text('Delete')),
                              ],
                            ),
                          );
                          setState(() {});
                        },
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
        ));
  }
}
