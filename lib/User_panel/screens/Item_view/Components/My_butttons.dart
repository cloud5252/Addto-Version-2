import 'package:flutter/material.dart';

class MyButtonsss1 extends StatelessWidget {
  final Function()? onTap;

  const MyButtonsss1({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.white24, Colors.black54],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.2, 2.9]),
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
