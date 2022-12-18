import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
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
          "Sign up",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  child: Image.asset(
                    "assets/img/logo_quiz.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                //Hello again
                const Text(
                  'HELLO AGAIN!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome back, you've been missed",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Name'),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 10,
                ),
                //Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),
                ),
                //Password textfield
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm password'),
                      ),
                    ),
                  ),
                ),
                //Sign in button
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.purple[900],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text('Không được để trống'),
                                  );
                                });
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Thông báo'),
                                    content: Text(
                                        'Mật khẩu và mật khẩu xác nhận khác nhau'),
                                  );
                                });
                          } else {
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);

                              // ignore: unnecessary_null_comparison
                              if (newUser != null) {
                                _firestore.collection('users').add({
                                  'email': _emailController.text,
                                  'name': _nameController.text,
                                  'password': _passwordController.text,
                                  "photoUrl":
                                      "https://scr.vn/wp-content/uploads/2020/07/Avatar-Facebook-tr%E1%BA%AFng.jpg",
                                  "money": 50000,
                                  "rank": "NA",
                                  "level": "0"
                                });
                                Navigator.pop(context, 'Đăng ký thành công');
                              } else {
                                final snackBar = SnackBar(
                                    content:
                                        Text('Tài khoản đăng ký không hợp lệ'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } catch (e) {
                              final snackBar =
                                  SnackBar(content: Text('Có lỗi xảy ra!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400],
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
