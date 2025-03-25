import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/login_register_page.dart';
import 'package:mybekkar/User_panel/screens/Service/Auth/google_auth.dart';
import 'package:stacked/stacked.dart';

import '../../components/email.button.dart';
import '../../components/google_button.dart';
import 'wellcom_view_model.dart';

class WellcomeView extends StatelessWidget {
  const WellcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WellcomViewModel>.reactive(
      viewModelBuilder: () => WellcomViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.blue.shade900,
            title: const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.blue.shade900,
                height: 300,
                child: Lottie.asset('assets/splash.json'),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Text(
                    'Happy Shopping',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GoogleButton(
                    text: 'Google Sign Up',
                    onTap: () =>
                        locator<GoogleAuth>().signInWithGoogle(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  emailbutton(
                    text: 'Email Sign Up',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginRegisterPage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
