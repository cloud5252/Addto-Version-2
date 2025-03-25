import 'package:flutter/material.dart';

class HelperDialogs {
  static void showsnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      shape: Border.all(
        color: Colors.white,
        width: 2,
      ),
      behavior: SnackBarBehavior.values[1],
      backgroundColor: Colors.blue.shade500,
    ));
  }

  static void showprogress(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
