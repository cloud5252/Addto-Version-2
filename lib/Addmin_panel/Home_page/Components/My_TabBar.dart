import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';

class MyTabbarr extends StatelessWidget {
  final TabController tabBarcontroller;
  const MyTabbarr({super.key, required this.tabBarcontroller});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((Category) {
      return Tab(
        text: Category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          child: TabBar(
            splashBorderRadius: BorderRadius.circular(22),
            controller: tabBarcontroller,
            tabs: _buildCategoryTabs(),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
