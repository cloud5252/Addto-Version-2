// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mybekkar/User_panel/screens/Welcome/wellcome_view.dart';
import 'package:mybekkar/User_panel/screens/login/forget_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../components/My_text_field.dart';
import '../../components/forget_password_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetViewModel>.reactive(
      viewModelBuilder: () => ForgetViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.blue.shade900,
                    height: 250,
                    child: Lottie.asset('assets/splash.json'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            MyTextField(
                              controller: viewmodel.emailControllers,
                              hintText: "Email",
                              obscurdtext: false,
                            ),
                            SizedBox(height: 30),
                            ForgetPasswordButton(
                                onTap: () => viewmodel.forgetpassword(),
                                text: 'Forget'),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Not a member?"),
                                GestureDetector(
                                  onTap: () => Get.to(WellcomeView()),
                                  child: const Text(
                                    " Register Now",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
