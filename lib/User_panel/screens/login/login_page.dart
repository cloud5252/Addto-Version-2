import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/login/Forget_password.dart';
import 'package:mybekkar/User_panel/screens/login/signIn_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../components/My_button.dart';
import '../../components/My_text_field.dart';
import '../../components/google_button.dart';
import '../Fire_base_service/auth_service.dart';
import '../Service/Auth/google_auth.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  final authServices = locator<AuthServices>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => SigninViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.blue.shade900,
                  height: 260,
                  width: 400,
                  child: Lottie.asset('assets/splash.json'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: viewmodel.emailController,
                            hintText: "Email",
                            obscurdtext: false,
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            controller: viewmodel.passwordController,
                            hintText: "Password",
                            obscurdtext: false,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(ForgetPassword()),
                                child: Text(
                                  'Forget Password!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                              text: "Sign In",
                              onTap: () => viewmodel.signIn(
                                    context,
                                  )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child:
                                    Divider(thickness: 2, color: Colors.white),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Or Continue With'),
                              ),
                              Expanded(
                                child:
                                    Divider(thickness: 2, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          GoogleButton(
                            text: "Google Sign In",
                            onTap: () =>
                                locator<GoogleAuth>().signInWithGoogle(context),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Not a member?"),
                              GestureDetector(
                                onTap: onTap,
                                child: const Text(
                                  " Register Now",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
        );
      },
    );
  }
}
