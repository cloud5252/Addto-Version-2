import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Add_To_Cart/Add_to_view_model.dart';
import 'package:mybekkar/User_panel/screens/Add_To_Cart/Component/My_checkoutbutton.dart';
import 'package:stacked/stacked.dart';

import 'Component/Add_to_Cart.dart';

class AddToView extends StackedView<AddToViewModel> {
  const AddToView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddToViewModel viewModel,
    Widget? child,
  ) {
    final cartItems1 = viewModel.usercart1;

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.showdailog(context);
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.delete,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          cartItems1.isEmpty
              ? Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'lib/screens/splash_screens/images/empty3.png',
                        ),
                      ),
                      color: Colors.blue.shade200,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 0,
                        child: ListView.builder(
                          itemCount: cartItems1.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartItems1[index];
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              viewModel.rebuildUi();
                            });

                            return ListTile(
                              title: MyCartTile1(cartItem1: cartItem),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: MyCheckoutbutton(
              text: "CheckOut",
              ontep: () {
                viewModel.itemIsRequired(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  AddToViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddToViewModel();
}
