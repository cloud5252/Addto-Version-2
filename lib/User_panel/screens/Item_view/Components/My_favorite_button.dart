import 'package:flutter/material.dart';

class MyFavoriteButton extends StatelessWidget {
  final Function()? ontep;
  const MyFavoriteButton({super.key, required this.ontep});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.favorite_border));
  }
}
