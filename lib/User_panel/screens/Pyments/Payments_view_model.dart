import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Delevory_page/delevory_progress_view.dart';
import 'package:stacked/stacked.dart';

class PaymentsViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  userTapedPay(BuildContext context) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DelevoryProgressView(),
                  ),
                ).then((_) => Navigator.pop(context));
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }
}
