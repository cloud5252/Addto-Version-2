import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/register/register_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../components/My_button.dart';
import '../../components/My_text_field.dart';
import '../../components/google_button.dart';
import '../Service/Auth/google_auth.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewmodel, child) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.grey,
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: Colors.blue.shade900,
                      height: 200,
                      width: 400,
                      child: Lottie.asset('assets/splash.json'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                "Let's create an account for you!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              MyTextField(
                                controller: viewmodel.namecontroller,
                                hintText: "Name",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: viewmodel.Emailcontroller,
                                hintText: "Email",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: viewmodel.phonecontroller,
                                hintText: "Phone Number",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: viewmodel.citycontroller,
                                hintText: "City",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: viewmodel.Passwordcontroller,
                                hintText: "Password",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: viewmodel.Confirmpasswordcontroller,
                                hintText: "Confirm Password",
                                obscurdtext: false,
                              ),
                              const SizedBox(height: 25),
                              MyButton(
                                text: "Sign Up",
                                onTap: () {
                                  viewmodel.signUp(context);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                        thickness: 2, color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text('Or Continue With'),
                                  ),
                                  Expanded(
                                    child: Divider(
                                        thickness: 2, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              GoogleButton(
                                text: "Google Sign In",
                                onTap: () => locator<GoogleAuth>()
                                    .signInWithGoogle(context),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already a member?"),
                                  GestureDetector(
                                    onTap: onTap,
                                    child: const Text(
                                      " Login Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
