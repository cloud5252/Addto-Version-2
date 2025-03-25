import 'package:mybekkar/User_panel/screens/Add_To_Cart/Add_to_view_model.dart';
import 'package:mybekkar/User_panel/screens/Wish_list/Components/My_quantity_selector.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:mybekkar/User_panel/screens/Service/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyCartTile1 extends StatelessWidget {
  final CartItem cartItem1;

  const MyCartTile1({required this.cartItem1, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<cloud>.reactive(
      viewModelBuilder: () => cloud(),
      builder: (context, viewmodel1, child) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 600),
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
                          cartItem1.food.imagpath,
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
                            Text(cartItem1.food.name),
                            Text(
                              '\$${cartItem1.food.price}',
                            ),
                          ],
                        ),
                      ),
                      MyQuantitySelector(
                        quantity: cartItem1.quantitty,
                        food: cartItem1.food,
                        onIncreament: () {
                          final retorent = locator<AddToViewModel>();
                          retorent.addToCart(cartItem1.food);
                        },
                        onDecreament: () {
                          final retorent = locator<Saller>();
                          cartItem1.decreament();
                          if (cartItem1.quantitty < 1) {
                            retorent.removedFromCart(cartItem1, context);
                          }
                        },
                      )
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
