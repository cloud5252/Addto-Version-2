import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Service/cart_data.dart';

class ProfileImageEdit extends StatelessWidget {
  const ProfileImageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<profileImageEditModel>.reactive(
      viewModelBuilder: () => profileImageEditModel(),
      builder: (context, viewmodel, child) {
        return Stack(
          children: [
            Center(
              child: CircleAvatar(
                  backgroundImage: viewmodel.image != null
                      ? FileImage(viewmodel.image!)
                      : null,
                  radius: 50,
                  child: viewmodel.image == null
                      ? const Icon(
                          Icons.person,
                          size: 50,
                        )
                      : null),
            ),
            Positioned(
              top: 55,
              right: 105,
              child: IconButton(
                  onPressed: () {
                    viewmodel.pickImage();
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.edit,
                      ),
                    ),
                  )),
            )
          ],
        );
      },
    );
  }
}

class profileImageEditModel extends BaseViewModel {
  final saller = locator<Saller>();
  List<CartItem> get usercart1 => saller.cartItems1;
  List<CartItem> get usercart2 => saller.cartItems;

  final currentuser = FirebaseAuth.instance.currentUser!;
  File? image;
  late ImagePicker _picker;

  profileImageEditModel() {
    _loadImage();
  }

  Future<void> pickImage() async {
    _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      _saveImage(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> _saveImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      image = File(imagePath);
      notifyListeners();
    }
  }
}
