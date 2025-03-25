import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Pyments/Payments_view_model.dart';
import 'package:stacked/stacked.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentsViewModel>.reactive(
      viewModelBuilder: () => PaymentsViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Checkout"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // CreditCardWidget(
                //   cardNumber: viewmodel.cardNumber,
                //   expiryDate: viewmodel.expiryDate,
                //   cardHolderName: viewmodel.cardHolderName,
                //   cvvCode: viewmodel.cvvCode,
                //   showBackView: viewmodel.isCvvFocused,
                //   onCreditCardWidgetChange: (p0) {},
                // ),
                // CreditCardForm(
                //   cardNumber: viewmodel.cardNumber,
                //   expiryDate: viewmodel.expiryDate,
                //   cardHolderName: viewmodel.cardHolderName,
                //   cvvCode: viewmodel.cvvCode,
                //   onCreditCardModelChange: (data) {
                //     viewmodel.cardNumber = data.cardNumber;
                //     viewmodel.expiryDate = data.expiryDate;
                //     viewmodel.cardHolderName = data.cardHolderName;
                //     viewmodel.cvvCode = data.cvvCode;
                //     viewmodel.rebuildUi();
                //   },
                //   formKey: viewmodel.formKey,
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => viewmodel.userTapedPay(context),
                  child: const Text('Pay Now'),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
