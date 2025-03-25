import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'package:flutter/material.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;

  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncreament,
      required this.onDecreament});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecreament,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.lightBlue,
            ),
          ),
          const SizedBox(width: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(quantity.toString()),
            ),
          ),
          const SizedBox(width: 7),
          GestureDetector(
            onTap: onIncreament,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
