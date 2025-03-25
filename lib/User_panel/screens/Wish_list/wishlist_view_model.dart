import 'package:flutter/material.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:mybekkar/User_panel/screens/Service/cart_data.dart';
import 'package:stacked/stacked.dart';
import '../Service/Food.dart';

class CartViewModel extends BaseViewModel {
  final Saller _usercart = locator<Saller>();

  List<CartItem> get usercart => _usercart.cartItems;
  void showdailog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Deleted All Items'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              if (usercart.isNotEmpty) {
                clearFavoritItem();
                Navigator.of(ctx).pop();
              } else {
                Navigator.of(ctx).pop();
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  void clearFavoritItem() {
    _usercart.clearCart1();
    rebuildUi();
  }

  void addToCart(Food food, BuildContext context) {
    final retorent = locator<Saller>();
    retorent.addToCart1(food);

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

    // Remove overlay after a delay
    Future.delayed(
      const Duration(seconds: 2),
      () {
        overlayEntry.remove();
      },
    );
  }
}
