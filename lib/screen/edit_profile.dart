import 'package:flutter/material.dart';

class Edit_Profile extends StatefulWidget {
  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(206, 252, 83, 83),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/img/person.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'FullName',
                    hintText: 'Thành Đạt'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'E-mail',
                    hintText: 'Dat@gmail.com'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Password',
                    hintText: '***********'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Address',
                    hintText: 'Q.7, TP. HCM'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20));
                      }),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) {
                        return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20));
                      }),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('SAVE'),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
