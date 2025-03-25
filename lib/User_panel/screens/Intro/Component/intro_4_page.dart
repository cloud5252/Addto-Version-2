import 'package:mybekkar/User_panel/screens/Intro/Intro_view_modol.dart';
import 'package:mybekkar/User_panel/screens/Intro/Intro_view_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../components/google_button.dart';

class Intro4Page extends StackedView<IntroViewModol> {
  const Intro4Page({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModol viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              viewModel.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: getstarted(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroViewPage()));
                },
                text: 'Get Started'),
          ),
        ],
      ),
    );
  }

  @override
  IntroViewModol viewModelBuilder(
    BuildContext context,
  ) =>
      IntroViewModol();
}
