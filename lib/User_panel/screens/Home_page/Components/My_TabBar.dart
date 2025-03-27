import 'package:flutter/material.dart';
import '../homr_view_model.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabBarcontroller;

  const MyTabbar({super.key, required this.tabBarcontroller});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        color: Colors.blue.shade200,
        child: TabBar(
          controller: tabBarcontroller,
          tabs: _buildCategoryTabs(),
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          splashBorderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
