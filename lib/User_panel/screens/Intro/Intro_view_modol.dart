import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class IntroViewModol extends BaseViewModel {
  PageController controller = PageController();
  bool onlastpage = true;
  TextStyle buttonTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  String image = "lib/User_panel/screens/splash_screens/images/intro.jpg";
}
