import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mybekkar/User_panel/screens/Home_page/home_view.dart';
import 'package:stacked/stacked.dart';

import '../Service/Auth/google_auth.dart';

class RegisterViewModel extends BaseViewModel {
  final namecontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final Confirmpasswordcontroller = TextEditingController();
  void signUp(BuildContext context) async {
    String password = Passwordcontroller.text.trim();
    String confirmPassword = Confirmpasswordcontroller.text.trim();
    String name = namecontroller.text.trim();
    String email = Emailcontroller.text.trim();
    String phoneNumber = phonecontroller.text.trim();
    String city = citycontroller.text.trim();
    final googledevicetoken _googledevicetoken = Get.put(googledevicetoken());

    if (name.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        city.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Please check your Textfields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Please check your password & confirmed password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
      return;
    }

    try {
      EasyLoading.show(status: 'Please Wait..');
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Emailcontroller.text,
        password: password,
      );

      // await userCredential.user!.sendEmailVerification();
      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.email)
          .set({
        "bio": 'empty bio',
        "username": Emailcontroller.text.split('@')[0],
        "email": email,
        "uid": userCredential.user!.uid,
        "Phone": phoneNumber,
        "isActive": true,
        "createOn": DateTime.now(),
        "DeviceToken": _googledevicetoken.deviceToken.toString(),
        "status": name,
        "City": city,
        "addmin": true,
      });

      Get.to(() => HomeView());

      EasyLoading.dismiss();

      Get.snackbar(
        'Good',
        'Registration successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      EasyLoading.dismiss();
      print('Error: ${e.toString()}');
    }
  }
}
