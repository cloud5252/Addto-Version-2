import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final int quantity;
  final IconData icon;
  final Function() ontep;
  const MyDrawerTile({
    super.key,
    this.quantity = 0,
    required this.text,
    required this.icon,
    required this.ontep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: ListTile(
        hoverColor: Colors.blue.shade300,
        title: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: (text == "Orders" || text == "Wishlist")
            ? Text(
                "( ${quantity.toString()} )",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            : null,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        onTap: ontep,
      ),
    );
  }
}
