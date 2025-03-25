import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Order/Order.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Users.dart';
import 'package:mybekkar/User_panel/screens/Add_To_Cart/Add_to_view.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/auth_service.dart';
import 'package:mybekkar/User_panel/screens/Home_page/Components/my_drawer_Tile.dart';
import 'package:mybekkar/User_panel/screens/Location/location_view.dart';
import 'package:mybekkar/User_panel/screens/Profile/Components/profile_image_edit.dart';
import 'package:mybekkar/User_panel/screens/Profile/profile_view.dart';
import 'package:mybekkar/User_panel/screens/Wish_list/wishlist_view.dart';
import 'package:stacked/stacked.dart';
import '../../../Locator/app.locator.dart';

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
              // Profile Section
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

              // Scrollable List Section
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
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
                      text: 'Users',
                      icon: Icons.person,
                      ontep: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Users()),
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
                          MaterialPageRoute(builder: (context) => AddToView()),
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
                          MaterialPageRoute(builder: (context) => Order()),
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
                      text: 'Reviews',
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
                      text: 'Categories',
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
                  ],
                ),
              ),
              // Logout Section
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
