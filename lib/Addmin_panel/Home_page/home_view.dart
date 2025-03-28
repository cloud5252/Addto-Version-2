import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Home_page/Components/My_Offer_collection.dart';
import 'package:mybekkar/Addmin_panel/Home_page/Components/My_TabBar.dart';
import 'package:mybekkar/Addmin_panel/Home_page/Components/Myfood_tile.dart';
import 'package:mybekkar/Addmin_panel/Home_page/Components/my_drawer.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'Components/My_Sliver_appbar.dart';
import 'homr_view_model.dart';

class HomeViewaddmin extends StatefulWidget {
  const HomeViewaddmin({super.key});

  @override
  State<HomeViewaddmin> createState() => _HomeViewaddminState();
}

class _HomeViewaddminState extends State<HomeViewaddmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return MyFoodTilee(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SizedBox();
                },
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerr(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Panda",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        toolbarHeight: 30.0,
        backgroundColor: Colors.blue.shade200,
      ),
      backgroundColor: Colors.blue.shade200,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MYSeliverAppbarr(
            title: MyTabbarr(tabBarcontroller: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyNewCollectionn(text: "New Vintage Collection"),
                ),

                // const MyDescriptionbox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(locator<Saller>().menu),
        ),
      ),
    );
  }
}
