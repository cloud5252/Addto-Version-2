// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/login_register_page.dart';
import 'package:stacked/stacked.dart';

import '../Home_page/home_view.dart';

class AuthServices extends BaseViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> forgetWithEmailandPassword(String email) async {
    try {
      EasyLoading.show(status: 'please wait..');
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      Get.snackbar(
        'Request sent successfull',
        'Password reeesr link sent to:\n$email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );
    }
  }

  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      // Sign in with email and password
      UserCredential? userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
      }, SetOptions(merge: true));
      Get.to(() => HomeView());
      Get.snackbar(
        'Good',
        'Sign In successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900,
        colorText: Colors.white,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign-out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    Get.to(() => LoginRegisterPage());
  }

  User? getcurrentuser() {
    return _firebaseAuth.currentUser;
  }
}
