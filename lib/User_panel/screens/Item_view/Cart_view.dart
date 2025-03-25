import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:mybekkar/User_panel/screens/Item_view/Cart_view_model.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'Components/My_button.dart';

class CartView extends StatelessWidget {
  final Food food;

  const CartView({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset(
                        filterQuality: FilterQuality.high,
                        food.imagpath,
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
                                  food.name,
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
                            '\$${food.price}',
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
                  onTap: () {
                    viewModel.addToCart(food, context);
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
