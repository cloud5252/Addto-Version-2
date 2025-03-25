import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Home_page/Components/my_drawer_Tile.dart';
import 'package:mybekkar/User_panel/screens/Profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import '../../../../Locator/app.locator.dart';
import '../../Add_To_Cart/Add_to_view.dart';
import '../../Wish_list/wishlist_view.dart';
import '../../Fire_base_service/auth_service.dart';
import '../../Location/location_view.dart';
import '../../Profile/Components/profile_image_edit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<profileImageEditModel>.reactive(
      viewModelBuilder: () => profileImageEditModel(),
      builder: (context, viewmodel, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viewmodel.rebuildUi();
        });

        return Drawer(
          width: 250,
          backgroundColor: Colors.blue.shade200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                    backgroundImage: viewmodel.image != null
                        ? FileImage(viewmodel.image!)
                        : null,
                    radius: 40,
                    child: viewmodel.image == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                          )
                        : null),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  viewmodel.currentuser.email!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              MyDrawerTile(
                text: 'Profile',
                icon: Icons.person,
                ontep: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()),
                  );
                },
              ),
              MyDrawerTile(
                text: "Orders",
                quantity: viewmodel.usercart1.fold(0, (sum, item) {
                  return sum + item.quantitty;
                }),
                icon: Icons.shopping_cart,
                ontep: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddToView()),
                  );
                },
              ),
              MyDrawerTile(
                text: "Wishlist",
                quantity: viewmodel.usercart2.fold(0, (sum, item) {
                  return sum + item.quantitty;
                }),
                icon: Icons.favorite,
                ontep: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartViewPage()),
                  );
                },
              ),
              MyDrawerTile(
                text: "Location",
                icon: Icons.location_on_outlined,
                ontep: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationView()),
                  );
                },
              ),
              const Spacer(),
              MyDrawerTile(
                text: "Logout",
                icon: Icons.logout,
                ontep: () => locator<AuthServices>().signOut(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
