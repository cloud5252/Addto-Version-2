import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/auth_service.dart';
import 'package:mybekkar/User_panel/screens/Profile/Components/profile_image_edit.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:stacked/stacked.dart';
import '../../Locator/app.locator.dart';

class HomrViewModeladdmin extends BaseViewModel {
  final junaid = locator<AuthServices>();
  final imager = locator<profileImageEditModel>();
  void addToCart1(Food food, BuildContext context) {
    final retorent = locator<Saller>();
    retorent.addToCart(food);

    Navigator.pop(context);
  }

  void addToCart11(Food food, BuildContext context) {
    final retorent = locator<Saller>();
    retorent.addToCart(food);

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 10,
        left: 10,
        right: 10,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.shade100,
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                '${food.name} added to cart!',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        overlayEntry.remove();
      },
    );
  }
}

class CartItem11 {
  final String name;
  final int quantity;

  CartItem11({required this.name, this.quantity = 0});
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}
