import 'dart:developer';

import 'package:blood_donation/Screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class screenlogin extends StatefulWidget {
  const screenlogin({Key? key}) : super(key: key);

  @override
  State<screenlogin> createState() => _screenoneState();
}

class _screenoneState extends State<screenlogin> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _errormessage = "Username Password does not Match";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(50),
                child: Text(
                  "Login Page",
                  style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "User Name",
                    hintText: "Enter Your Name",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordcontroller,
                  maxLength: 10,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      log("forgot button pressed");
                    },
                    child: Text("Forgot Password")),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    logincheck(context);
                  },
                  child: Text("Login"),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(350, 40))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Does not have account ?",
                    ),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          log("sign up button pressed");
                        },
                        child: Text("Sign up")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void logincheck(BuildContext context) {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;

    if (_username == _password) {
      //go to home
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errormessage),
        ),
      );
      //Alert Dialog

      //Show Text
    }
  }
}
