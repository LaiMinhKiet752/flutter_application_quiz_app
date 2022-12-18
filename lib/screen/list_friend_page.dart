import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/friend_detail_page.dart';

class Friend_List extends StatefulWidget {
  const Friend_List({super.key});

  @override
  State<Friend_List> createState() => _Friend_ListState();
}

class _Friend_ListState extends State<Friend_List> {
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text(
          "Friends list",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('friend').get(),
          builder: (context, snapshot) {
            List<Map<String, String>> users = [];
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                if (_auth.currentUser!.email == r['friend_1']) {
                  Map<String, String> user = {
                    'friend_1': r['friend_1'],
                    'email': r['friend_2'],
                    'name': r['friend_name_2'],
                  };
                  users.add(user);
                }
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FriendDetail(
                              friendName: (users[index])['name'].toString(),
                              friendEmail: (users[index])['email'].toString(),
                            ),
                          ),
                        );
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
      ),
    );
  }
}
