import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/friend_detail.dart';
import 'package:quiz_app/services/friend_provider.dart';
import 'package:quiz_app/services/friends_object.dart';

class ListFriends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListFriendsState();
  }
}

class ListFriendsState extends State<ListFriends> {
  var online = [
    Text("Online 1 minute ago "),
    Text("Online 2 minutes ago "),
    Text("Online 10 minutes ago "),
    Text("Online 15 minutes ago "),
    Text("Online 5 minutes ago "),
    Text("Online 2 hours ago "),
    Text("Online 2 hours ago "),
    Text("Online 4 minutes ago "),
    Text("Online 4 minutes ago "),
    Text("Online 1 minute ago "),
    Text("Online 3 minutes ago "),
    Text("Online 15 minutes ago "),
    Text("Online 18 minutes ago "),
    Text("Online 26 minutes ago "),
    Text("Online 10 minutes ago "),
    Text("Online 21 minutes ago "),
    Text("Online 23 minutes ago "),
    Text("Online 25 minutes ago "),
    Text("Online 21 minutes ago "),
    Text("Online 29 minutes ago "),
    Text("Online 50 minutes ago "),
    Text("Online 40 minutes ago "),
    Text("Online 45 minutes ago "),
    Text("Online 8 minutes ago "),
    Text("Online 10 days ago "),
    Text("Online 1 days ago "),
    Text("Online 2 days ago "),
    Text("Online 10 days ago "),
    Text("Online 15 days ago "),
    Text("Online 3 days ago "),
  ];
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
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
        title: Text(
          "Friends List",
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
              trailing: online[index],
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
