import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:mybekkar/User_panel/screens/Item_view/Cart_view_model.dart';
import '../Fire_base_service/auth_Food_Models.dart';
import 'Components/My_button.dart';

class CartView extends StatelessWidget {
  final Foodd food;

  const CartView({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    final Foodd foood = Foodd(
      foodId: food.foodId,
      foodImage: food.foodImage,
      foodName: food.foodName,
      createAt: DateTime.now(),
      updataAt: DateTime.now(),
      category: food.category,
      Price: food.Price,
      description: food.description,
      foodquentity: food.foodquentity,
      foodprice: double.parse(food.foodprice.toString()),
    );
    Future<void> Addtocartexisting(
        {required String uid, int quantityincreament = 1}) async {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection('cart')
          .doc(uid)
          .collection('cartOrders')
          .doc(foood.foodId.toString());

      DocumentSnapshot snapshot = await documentReference.get();

      if (snapshot.exists) {
        int currentquentity = snapshot['foodquantity'];
        int updataquantity = currentquentity + quantityincreament;
        double totalprice = double.parse(foood.Price) * updataquantity;

        await documentReference.update({
          'foodquantity': updataquantity,
          'foodprice': totalprice,
        });
      } else {
        await FirebaseFirestore.instance.collection('cart').doc(uid).set(
          {
            'uid': uid,
            'createAt': DateTime.now(),
          },
        );
        await documentReference.set({
          ...foood.toMap(),
          'foodquantity': quantityincreament,
          'foodprice': double.parse(foood.Price),
        });
        print('product added');
      }
    }

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 360,
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        food.foodImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        border: const Border(
                          top: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          bottom: BorderSide.none,
                        ),
                      ),
                      height: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  food.foodName,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      viewModel.showRatingDialog(context);
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${viewModel.rating}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${food.Price}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            food.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: double.infinity,
              ),
              Positioned(
                bottom: 10,
                left: 5,
                right: 5,
                child: MyButtons(
                  text: "Add To Cart",
                  onTap: () async {
                    await Addtocartexisting(uid: user!.uid);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
