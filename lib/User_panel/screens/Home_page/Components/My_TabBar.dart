import 'package:flutter/material.dart';

import '../homr_view_model.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabBarcontroller;
  const MyTabbar({super.key, required this.tabBarcontroller});

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
