import 'package:flutter/material.dart';

class MyButtonsss extends StatefulWidget {
  final Function()? onTap;
  final String text;

  const MyButtonsss({super.key, required this.onTap, required this.text});

  @override
  _MyButtonsssState createState() => _MyButtonsssState();
}

class _MyButtonsssState extends State<MyButtonsss> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: 1.2),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      onEnd: () {
        setState(() {});
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
