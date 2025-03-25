import 'package:flutter/material.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Delevory_page/delevory_progress_view.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:mybekkar/User_panel/screens/Service/cart_data.dart';
import 'package:stacked/stacked.dart';

import '../Service/Food.dart';

class AddToViewModel extends BaseViewModel {
  final Saller _usercart1 = locator<Saller>();
  List<CartItem> get usercart1 => _usercart1.cartItems1;

  rebuild() {
    rebuild();
  }

  void addToCart(Food food) {
    final retorent = locator<Saller>();
    retorent.addToCart1(food);
  }

  void clearCart() {
    _usercart1.clearCart();
    rebuildUi();
  }

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
              if (usercart1.isNotEmpty) {
                clearCart();
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

  void itemIsRequired(BuildContext context) {
    if (usercart1.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DelevoryProgressView()),
      );
    } else {
      final overlay = Overlay.of(context);
      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade100,
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'No Item In The Cart!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );

      overlay.insert(overlayEntry);

      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          overlayEntry.remove();
        },
      );
    }
  }
}

class cloud extends BaseViewModel {}
