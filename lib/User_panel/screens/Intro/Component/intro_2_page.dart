import 'package:flutter/material.dart';

class Intro2Page extends StatelessWidget {
  const Intro2Page({super.key});

  @override
  Widget build(BuildContext context) {
    String image = "lib/User_panel/screens/splash_screens/images/intro3.jpg";
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
