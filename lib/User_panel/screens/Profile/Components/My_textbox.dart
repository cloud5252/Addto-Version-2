import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String userName;
  final void Function()? pressed;
  const MyTextBox(
      {super.key,
      required this.text,
      required this.userName,
      required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              IconButton(
                onPressed: pressed,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
