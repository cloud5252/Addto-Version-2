import 'package:mybekkar/User_panel/screens/Wish_list/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'Components/My_favorit_tile.dart';

class CartViewPage extends StackedView<CartViewModel> {
  const CartViewPage({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    final cartItems = viewModel.usercart;

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Favorits Item",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.showdailog(context),
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
      body: cartItems.isEmpty
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
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          viewModel.rebuildUi();
                        });

                        return ListTile(
                          title: MyCartTile(cartItem.food, cartItem: cartItem),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
