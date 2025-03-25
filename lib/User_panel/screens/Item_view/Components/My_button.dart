import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButtons({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            // gradient: const LinearGradient(
            //   colors: [Colors.white24, Colors.black54],
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   stops: [0.2, 2.9],
            // ),
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
