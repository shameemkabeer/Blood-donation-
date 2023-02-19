import 'package:blood_donation/screenlogin.dart';
import 'package:flutter/material.dart';
import 'Screen_home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    loginscreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Expanded(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Image.asset(
                    "assets/image/heartbeat.gif",
                    scale: 3,

                    // height: 100.0,
                    // width: 100.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "from",
                  //   style: TextStyle(color: Colors.black54),
                  // ),
                  Text(
                    "Blood Donation",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "from",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    "Shameem Kabeer",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginscreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
