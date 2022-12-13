import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/friend_detail.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/services/friend_provider.dart';
import 'package:quiz_app/services/friends_object.dart';

class AddNewFriend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNewFriendState();
  }
}

class AddNewFriendState extends State<AddNewFriend> {
  List<FriendObject> lsFriends = [];
  void _loadDanhSach() async {
    final data = await FriendProvider.getAllContacts();
    setState(() {
      lsFriends = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadDanhSach();
  }

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
          "Make a new friend",
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: ListView.builder(
          itemCount: lsFriends.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(lsFriends[index].picture),
              ),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Send friend request successfully!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              title: Text(lsFriends[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lsFriends[index].phone),
                  Text(lsFriends[index].email),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendDetail(
                      friend: lsFriends[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
