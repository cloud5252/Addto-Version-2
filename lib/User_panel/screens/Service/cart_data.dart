import 'Food.dart';

class CartItem {
  Food food;
  int quantitty;

  CartItem({
    required this.food,
    this.quantitty = 1,
  });

  void decreament() {
    quantitty--;
  }

  void increament() {
    quantitty++;
  }

  @override
  String toString() {
    return 'CartItem(  quantity: $quantitty,  )';
  }
}
