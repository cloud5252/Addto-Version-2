import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';

class MyFoodTilee extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTilee({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        '\$${food.price}',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        food.description,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all()),
                    child: Image.asset(
                      food.imagpath,
                      filterQuality: FilterQuality.high,
                      height: 100,
                      width: 100,
                      scale: 0.8,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          height: 100,
                          width: 100,
                          child: const Icon(Icons.error), // Default error icon
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.white,
          endIndent: 10,
          indent: 10,
        )
      ],
    );
  }
}
