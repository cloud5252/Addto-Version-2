// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/Locator/app.router.dart';
import 'package:mybekkar/User_panel/screens/Home_page/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ADDMIN_VIEW/Addmin_view.dart';
import '../Fire_base_service/addmin&userdata.dart';
import '../Welcome/wellcome_view.dart';

class SplashViewModel extends BaseViewModel {
  String image = "lib/screens/splash_screens/images/intro5.jpg";
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SplashViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToHome();
    });
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      loggdin();
    });
    _navigationService.navigateTo(Routes.intro4Page);
  }

  Future<void> loggdin() async {
    if (firebaseAuth.currentUser != null) {
      final Addminuserdata addminuserdata = Get.put(Addminuserdata());
      final userData =
          await addminuserdata.getUserData(firebaseAuth.currentUser!.uid);

      if (userData.isNotEmpty) {
        var userDocument = userData[0].data() as Map<String, dynamic>;

        if (userDocument['addmin'] == true) {
          Get.offAll(() => AddminView());
        } else {
          Get.offAll(() => HomeView());
        }
      } else {
        Get.offAll(() => WellcomeView());
      }
    }
  }
}
