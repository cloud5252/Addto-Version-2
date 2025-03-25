import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Intro/Component/intro_1_page.dart';
import 'package:mybekkar/User_panel/screens/Intro/Component/intro_2_page.dart';
import 'package:mybekkar/User_panel/screens/Intro/Component/intro_3_page.dart';
import 'package:mybekkar/User_panel/screens/Intro/Intro_view_modol.dart';
import 'package:mybekkar/User_panel/screens/Welcome/wellcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

class IntroViewPage extends StatelessWidget {
  const IntroViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModol>.reactive(
      viewModelBuilder: () => IntroViewModol(),
      builder: (context, viemodel, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viemodel.rebuildUi();
        });
        return Scaffold(
            body: Stack(
          children: [
            PageView(
              controller: viemodel.controller,
              onPageChanged: (index) {
                viemodel.onlastpage = (index == 1);
              },
              children: const [
                Intro1Page(),
                Intro2Page(),
                Intro3Page(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      viemodel.controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: viemodel.buttonTextStyle,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: viemodel.controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                        expansionFactor: 2,
                        activeDotColor: Colors.white,
                        strokeWidth: 8.0),
                  ),
                  viemodel.onlastpage
                      ? GestureDetector(
                          onTap: () {
                            viemodel.controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate,
                            );
                          },
                          child: Text(
                            "next",
                            style: viemodel.buttonTextStyle,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WellcomeView()));
                          },
                          child: Text(
                            "done",
                            style: viemodel.buttonTextStyle,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ));
      },
    );
  }
}
