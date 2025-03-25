import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Wish_list/wishlist_view_model.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:mybekkar/User_panel/screens/Service/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyCartTile extends StatelessWidget {
  final Food food;
  final CartItem cartItem;

  const MyCartTile(
    this.food, {
    required this.cartItem,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.nonReactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context, viewmodel, child) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 900),
          builder: (BuildContext context, double value, Widget? child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, value * 10),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white70,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.imagpath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem.food.name),
                            Text(
                              '\$${cartItem.food.price}',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            viewmodel.addToCart(food, context);
                            locator<Saller>().removedFromCart1(cartItem);
                            viewmodel.rebuildUi();
                          },
                          child: const Text("Cart"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
