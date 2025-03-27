// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Home_page/home_view.dart';
import 'package:stacked/stacked.dart';

import '../ADDMIN_VIEW/Addmin_view.dart';
import '../Fire_base_service/addmin&userdata.dart';
import '../Fire_base_service/auth_service.dart';

class SigninViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signIn(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final Addminuserdata addminuserdata = Get.put(Addminuserdata());
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      await locator<AuthServices>().signInWithEmailandPassword(
        email,
        password,
      );

      var userdata =
          await addminuserdata.getUserData(firebaseAuth.currentUser!.uid);

      if (userdata.isNotEmpty) {
        var userData = userdata[0].data() as Map<String, dynamic>;

        if (userData['addmin'] == true) {
          Get.offAll(() => AddminView());
          Get.snackbar(
            'Home View',
            'Successfully signed in as regular user',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue.shade900,
            colorText: Colors.white,
          );
        } else {
          Get.offAll(() => HomeView());
          Get.snackbar(
            'Admin View',
            'Successfully signed in as admin',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue.shade900,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'User data not found',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          colorText: Colors.white,
        );
      }

      // Check if the password matches the email (you can handle this based on your requirements)
      if (password != email) {
        Get.snackbar(
          'Error',
          'Please check your Email & password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.shade900,
          colorText: Colors.white,
        );
      }

      passwordController.clear();
    } catch (e) {
      // Error handling for empty text fields or other errors
      if (password.isEmpty || email.isEmpty) {
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
      print('Error:::::::::::::::$e');
    }
  }
}
