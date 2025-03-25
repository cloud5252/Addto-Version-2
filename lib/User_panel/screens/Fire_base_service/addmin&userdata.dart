import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Addminuserdata extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uid) async {
    final QuerySnapshot userDoc =
        await _firestore.collection('users').where('uid', isEqualTo: uid).get();

    return userDoc.docs;
  }
//   import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mybekkar/Addmin_panel/Home_page/home_view.dart';

// import 'login_register_page.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error.toString()}'),
//               );
//             }

//             if (snapshot.hasData) {
//               return HomeViewaddmin();
//             } else {
//               return const LoginRegisterPage();
//             }
//           }),
//     );
//   }
// }  ye code mara bikul theek work ker raha  ab ap is main apny logic add karo
}
