// ignore_for_file: unnecessary_overrides, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthBanners extends GetxController {
  RxList<String> bannersUrls = RxList<String>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchbannersUrls();
  }

  Future<void> fetchbannersUrls() async {
    try {
      QuerySnapshot bannersnapshot =
          await FirebaseFirestore.instance.collection('banners').get();

      if (bannersnapshot.docs.isNotEmpty) {
        bannersUrls.value = bannersnapshot.docs
            .map((doc) => doc['imageurl'] as String)
            .toList();
      }
    } catch (e) {
      print('Errors: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
