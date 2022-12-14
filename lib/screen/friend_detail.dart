import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/friends_object.dart';

// ignore: must_be_immutable
class FriendDetail extends StatefulWidget {
  FriendObject friend;
  FriendDetail({super.key, required this.friend});

  @override
  State<FriendDetail> createState() => _FriendDetailState();
}

class _FriendDetailState extends State<FriendDetail> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtName.text = this.widget.friend.name;
    txtPhone.text = this.widget.friend.phone;
    txtEmail.text = this.widget.friend.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Friend details'),
        backgroundColor: Color.fromARGB(255, 251, 100, 90),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            child: CachedNetworkImage(
              imageUrl: this.widget.friend.picture,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: txtName,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tên Liên Hệ',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: txtPhone,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Số Điện Thoại',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: txtEmail,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Trở Về',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
