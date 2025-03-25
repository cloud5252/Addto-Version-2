import 'package:mybekkar/User_panel/screens/Notification_screens/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade800, Colors.white54],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),

                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0.0, 0.0),
                  //     color: Colors.black,
                  //     blurRadius: 15,
                  //     spreadRadius: 0.0,
                  //   ),
                  //   BoxShadow(
                  //     offset: Offset(0.0, 0.0),
                  //     blurRadius: 15,
                  //     spreadRadius: 0.1,
                  //   ),
                  // ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey.shade800, Colors.white54],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),

                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(250),
                        bottomRight: Radius.circular(70)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0.0, 0.0),
                    //     color: Colors.black,
                    //     blurRadius: 15,
                    //     spreadRadius: 0.0,
                    //   ),
                    //   BoxShadow(
                    //     offset: Offset(0.0, 0.0),
                    //     blurRadius: 15,
                    //     spreadRadius: 0.1,
                    //   ),
                    // ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
