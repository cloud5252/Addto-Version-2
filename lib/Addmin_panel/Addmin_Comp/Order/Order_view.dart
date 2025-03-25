import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Order/Order_vew_Model.dart';
import 'package:stacked/stacked.dart';

class OrderView extends StatelessWidget {
  final String docId;
  final String customerName;
  const OrderView({required this.customerName, required this.docId, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderVewModel>.reactive(
      viewModelBuilder: () => OrderVewModel(docId: docId),
      builder: (context, viewmodel, child) {
        return Scaffold(
          body: viewmodel.buildUserList(),
        );
      },
    );
  }
}
