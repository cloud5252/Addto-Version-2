import 'package:flutter/material.dart';

class Intro3Page extends StatelessWidget {
  const Intro3Page({super.key});

  @override
  Widget build(BuildContext context) {
    String image = "lib/User_panel/screens/splash_screens/images/intro4.jpg";
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
