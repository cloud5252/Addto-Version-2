import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../Fire_base_service/auth_service.dart';

class ForgetViewModel extends BaseViewModel {
  final emailControllers = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void forgetpassword() async {
    String email = emailControllers.text.trim();

    try {
      await locator<AuthServices>().forgetWithEmailandPassword(
        email,
      );

      if (email.isEmpty) {
        Get.snackbar(
          'Error',
          'Please check your Email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      if (email.isEmpty) {
        Get.snackbar(
          'Error',
          'Please check your Textfields',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          colorText: Colors.white,
        );
      }
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
    }
  }

  // Sign-out
}
