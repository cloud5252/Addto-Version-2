import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';

class Food {
  final String imagpath;
  final String name;
  final double price;
  final String description;
  final FoodCategory category;

  Food(
    this.description, {
    required this.category,
    required this.imagpath,
    required this.name,
    required this.price,
  });
}
