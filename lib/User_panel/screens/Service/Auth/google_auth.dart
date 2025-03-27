// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mybekkar/Addmin_panel/Home_page/home_view.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/auth_User_Models.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/helper_dialogs.dart';
import 'package:mybekkar/User_panel/screens/register/register_view_model.dart';

class GoogleAuth {
  singinwithgoogle(BuildContext context) {
    HelperDialogs.showprogress(context);
    signInWithGoogle(context).then((user) {
      Navigator.pop(context);
      if (user != null) {
        print('\nuser: ${user.user}');
        print('\nuser AdditionalInfo:${user.additionalUserInfo}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeViewaddmin()));
      }
    });
  }

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    final googledevicetoken _googledevicetoken = Get.put(googledevicetoken());
    try {
      await InternetAddress.lookup('google.com');
      EasyLoading.show(status: 'Please wait...');
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // Google sign-in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      final RegisterViewModel registerPage = RegisterViewModel();

      if (user != null) {
        Models models = Models(
          uid: user.uid,
          username: user.displayName.toString(),
          email: user.email.toString(),
          phone: registerPage.phonecontroller.text.trim(),
          userimage: user.photoURL.toString(),
          userdivicetoken: _googledevicetoken.deviceToken.toString(),
          country: registerPage.citycontroller.text.trim(),
          useraddress: '',
          street: '',
          isaddmin: false,
          isactive: true,
          createdon: DateTime.now(),
          city: '',
        );
        await _firestore
            .collection("users")
            .doc(userCredential.user!.email)
            .set(models.toMap());
        EasyLoading.dismiss();

        // await _firestore.collection("users").doc(userCredential.user!.email).set({
        //   "email": user.email,
        //   "uid": user.uid,
        //   "username": user.email!.split('@')[0],
        //   "bio": 'empty bio',
        //   "about": 'Hey now users',
        //   "status": "sent",
        //   "Name": "admin"
        // }, SetOptions(merge: true));
      }

      return userCredential;
    } catch (e) {
      EasyLoading.dismiss();
      print("\nmessages for error: $e");
      HelperDialogs.showsnackbar(context, 'Check your Internet !');
      return null;
    }
  }
}

class googledevicetoken extends GetxController {
  String? deviceToken;
  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        update();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade300,
        colorText: Colors.white,
      );
    }
  }
}
