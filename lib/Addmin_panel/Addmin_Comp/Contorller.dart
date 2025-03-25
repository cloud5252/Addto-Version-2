import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Contorller extends GetxController {
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      usercontrollersubscription;
  final Rx<int> usercollectionlength = Rx<int>(0);
  @override
  void onInit() {
    super.onInit();
    usercontrollersubscription = _firestore
        .collection('users')
        .where('addmin', isEqualTo: false)
        .snapshots()
        .listen((snapshot) {
      usercollectionlength.value = snapshot.size;
    });
    @override
    void onClose() {
      usercontrollersubscription.cancel();
      super.onClose();
    }
  }
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Contorllers extends GetxController {
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      usercontrollersubscription;
  final Rx<int> usercollectionlength = Rx<int>(0);
  @override
  void onInit() {
    super.onInit();
    usercontrollersubscription =
        _firestore.collection('orders').snapshots().listen((snapshot) {
      usercollectionlength.value = snapshot.size;
    });
    @override
    void onClose() {
      usercontrollersubscription.cancel();
      super.onClose();
    }
  }
}
