import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:mybekkar/User_panel/screens/Item_view/Cart_view.dart';
import '../Fire_base_service/auth_Food_Models.dart';
import 'Components/My_Offer_collection.dart';
import 'Components/My_Sliver_appbar.dart';
import 'Components/My_TabBar.dart';
import 'Components/Myfood_tile.dart';
import 'Components/my_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
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

  Future<List<Foodd>> fetchFoodByCategory(FoodCategory category) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('foodcategory')
        .where('Categories', arrayContains: category.toString().split('.').last)
        .get();

    return snapshot.docs.map((doc) {
      return Foodd.fromFirestore(doc);
    }).toList();
  }

  List<Widget> getFoodInThisCategory() {
    return FoodCategory.values.map((category) {
      return FutureBuilder<List<Foodd>>(
        future: fetchFoodByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No items available for this category.'));
          }

          List<Foodd> categoryMenu = snapshot.data!;

          return ListView.builder(
            itemCount: categoryMenu.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final food = categoryMenu[index];
              return MyFoodTilee(
                food: food,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartView(food: food),
                  ),
                ),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        toolbarHeight: 56.0,
        backgroundColor: Colors.blue.shade200,
      ),
      backgroundColor: Colors.blue.shade200,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MYSeliverAppbar(
            title: MyTabbar(tabBarcontroller: _tabController),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyNewCollection(text: "New Vintage Collection"),
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children:
              getFoodInThisCategory(), // Display category-wise food data here
        ),
      ),
    );
  }
}
