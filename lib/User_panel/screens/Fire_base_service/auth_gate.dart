// // ignore_for_file: unnecessary_null_comparison

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../ADDMIN_VIEW/Addmin_view.dart';
// import '../Home_page/home_view.dart';
// import 'login_register_page.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error.toString()}'),
//             );
//           }

//           if (snapshot.hasData) {
//             final currentUser = snapshot.data!;

//             return StreamBuilder<DocumentSnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(currentUser.uid)
//                   .snapshots(),
//               builder: (context, userSnapshot) {
//                 if (userSnapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (userSnapshot.hasError) {
//                   return Center(child: Text('Error: ${userSnapshot.error}'));
//                 }

//                 print(' Error :::::::::::::::::::${userSnapshot.error}');

//                 if (userSnapshot.hasData) {
//                   final userDoc = userSnapshot.data!;
//                   final userData = userDoc.data() as Map<String, dynamic>;

//                   if (userData != null || userData['addmin'] == true) {
//                     WidgetsBinding.instance.addPostFrameCallback((_) {
//                       Get.offAll(() => AddminView());
//                     });
//                   } else {
//                     WidgetsBinding.instance.addPostFrameCallback((_) {
//                       Get.offAll(() => HomeView());
//                     });
//                   }

//                   return const SizedBox.shrink();
//                 } else {
//                   return const LoginRegisterPage();
//                 }
//               },
//             );
//           } else {
//             return const LoginRegisterPage();
//           }
//         },
//       ),
//     );
//   }
// }
