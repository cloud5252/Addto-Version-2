// import 'package:flutter/material.dart';

// class NewHomeView extends StatefulWidget {
//   const NewHomeView({super.key});

//   @override
//   State<NewHomeView> createState() => _NewHomeViewState();
// }

// class _NewHomeViewState extends State<NewHomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('new home'),
//       ),
//       // body: MyFoodTile(onTap: () {}),
//     );
//   }
// }


// Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       authFoodModels.foodName,
//                                       style: const TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(width: 20),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8),
//                                       border: Border.all()),
//                                   child: Image.network(
//                                     authFoodModels.foodImage,
//                                     fit: BoxFit.cover,
//                                     height: 100,
//                                     width: 100,
//                                     loadingBuilder:
//                                         (context, child, loadingProgress) {
//                                       if (loadingProgress == null) {
//                                         return child;
//                                       }
//                                       return Center(
//                                         child: CircularProgressIndicator(
//                                           value: loadingProgress
//                                                       .expectedTotalBytes !=
//                                                   null
//                                               ? loadingProgress
//                                                       .cumulativeBytesLoaded /
//                                                   (loadingProgress
//                                                           .expectedTotalBytes ??
//                                                       1)
//                                               : null,
//                                         ),
//                                       );
//                                     },
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Container(
//                                         color: Colors.grey,
//                                         height: 100,
//                                         width: 100,
//                                         child: const Icon(
//                                             Icons.error), // Default error icon
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Divider(
//                         color: Colors.white,
//                         endIndent: 10,
//                         indent: 10,
//                       )
//                     ],
//                   );