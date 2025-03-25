import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference order =
      FirebaseFirestore.instance.collection("orders");

  // Method to save order to Firestore
  Future saveOrderToDatabase(Map<dynamic, dynamic> receipt) async {
    try {
      await order.add({
        'AllOrders': receipt['AllOrders'],
        'date': receipt['date'], // Store the date
        'items': receipt['items'], // Store the items as an array of maps
        'totalItems': receipt['totalItems'], // Total item count
        'totalPrice': receipt['totalPrice'], // Total price
        'deliveryAddress': receipt['deliveryAddress'], // Delivery address
        // 'userEmail': receipt['userEmail'], // User Email
        // 'userName': receipt['userName'], // User Name
        'bio': 'empty bio', // Additional user info
        'about': 'Hey now users', // Info about the user
        'uid': FirebaseAuth.instance.currentUser?.uid,
        'Email': receipt['Email'], // User UID
        'Name': receipt['Name'], // User UID
        'Addmin': true, // User UID
      });
      print("Order successfully saved to Firestore");
    } catch (e) {
      print("Error saving order to Firestore: $e");
    }
  }
}
