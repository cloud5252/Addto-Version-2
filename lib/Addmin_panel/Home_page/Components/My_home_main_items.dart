// import 'package:flutter/material.dart';
// import 'package:mybekkar/app/app.locator.dart';
// import 'package:mybekkar/screens/Item_view/Cart_view.dart';
// import 'package:mybekkar/screens/Item_view/Cart_view_model.dart';
// import 'package:mybekkar/screens/Service/Food.dart';
// import 'package:mybekkar/screens/Service/Saller.dart';
// import 'package:mybekkar/screens/Home_page/Components/My_Plus_Add.dart';
// import 'package:stacked/stacked.dart';

// import '../homr_view_model.dart';

// class MyHomeMainItems extends StatelessWidget {
//   const MyHomeMainItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<HomeViewModel>.reactive(
//       viewModelBuilder: () => HomeViewModel(),
//       builder: (context, viewmodel, child) {
//         return GridView.builder(
//           itemCount: locator<Saller>().menu.length,
//           shrinkWrap: true,
//           physics: const AlwaysScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 15,
//             childAspectRatio: 0.8,
//           ),
//           itemBuilder: (context, index) {
//             final fooditems = locator<Saller>().menu[index];

//             return GestureDetector(
//               onTap: () {
//                 Food selectedItem = Food(
//                   imagePath: fooditems.imagePath,
//                   fooditems.description,
//                   name: fooditems.name,
//                   price: fooditems.price,
//                   category: null,
//                 );

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CartView(food: selectedItem),
//                   ),
//                 );
//               },
//               child: TweenAnimationBuilder(
//                 tween: Tween<double>(begin: 0, end: 1),
//                 duration: const Duration(milliseconds: 800),
//                 builder: (BuildContext context, double value, Widget? child) {
//                   return Opacity(
//                     opacity: value,
//                     child: Transform.translate(
//                       offset: Offset(0, (1 - value) * 40),
//                       child: child,
//                     ),
//                   );
//                 },
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(color: Colors.white, width: 2),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade300,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 6),
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 5),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         const Icon(
//                                           Icons.star,
//                                           color: Colors.yellow,
//                                         ),
//                                         const SizedBox(
//                                           width: 4,
//                                         ),
//                                         Text(
//                                           '${viewmodel.rating}',
//                                           style: const TextStyle(
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Center(
//                                     child: Container(
//                                       child: Image.asset(
//                                         fooditems.imagePath,
//                                         height: 100,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           fooditems.name,
//                                           style: const TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           "\$${fooditems.price}",
//                                           style: const TextStyle(
//                                             color: Colors.white54,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               right: 0,
//                               child: MyPlusAdd(
//                                 onTap: () {
//                                   locator<FavoriteViewModel>()
//                                       .addToCart11(fooditems, context);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
