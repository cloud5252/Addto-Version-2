import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:mybekkar/User_panel/screens/Service/cart_data.dart';
import 'package:collection/collection.dart';
import 'package:stacked/stacked.dart';
import 'Food.dart';

class Saller extends BaseViewModel {
  final List<Food> _menu = [
    Food(
      name: "Classic Cheeseburger",
      "Juicy beef patty with cheddar, lettuce, tomato, and pickles.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/burgers/burger1.jpg",
      price: 5.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: "Double Beef Deluxe",
      "Two beef patties with cheddar, lettuce, grilled onions, and pickles.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/burgers/burger2.jpg",
      price: 7.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: "Chicken Burger Supreme",
      "Crispy chicken fillet with lettuce, mayo, and a hint of chili sauce.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/burgers/burger3.jpg",
      price: 6.49,
      category: FoodCategory.burgers,
    ),
    Food(
      name: "Spicy Jalapeno Burger",
      "Beef patty with jalapenos, spicy sauce, lettuce, and cheddar cheese.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/burgers/burger4.jpg",
      price: 6.99,
      category: FoodCategory.burgers,
    ),
    Food(
      name: "Veggie Delight Burger",
      "Grilled veggie patty with lettuce, tomato, and vegan cheese.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/burgers/burger5.jpg",
      price: 5.49,
      category: FoodCategory.burgers,
    ),
    //salads

    Food(
      name: "Caesar Salad",
      "Crisp romaine lettuce with parmesan, croutons, and Caesar dressing.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/salads/salads1.jpg",
      price: 4.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: "Greek Salad",
      "Fresh cucumbers, tomatoes, feta cheese, olives, and onions with olive oil.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/salads/salads2.jpg",
      price: 5.49,
      category: FoodCategory.salads,
    ),
    Food(
      name: "Cobb Salad",
      "Mixed greens topped with grilled chicken, bacon, eggs, avocado, and blue cheese.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/salads/salads3.jpg",
      price: 6.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: "Garden Salad",
      "A fresh mix of greens, cucumbers, tomatoes, carrots, and bell peppers.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/salads/salads4.jpg",
      price: 3.99,
      category: FoodCategory.salads,
    ),
    Food(
      name: "Caprese Salad",
      "Slices of fresh mozzarella, tomatoes, and basil drizzled with balsamic glaze.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/salads/salads5.jpg",
      price: 5.29,
      category: FoodCategory.salads,
    ),

    //sides
    Food(
      name: "Garlic Bread",
      "Toasted bread with garlic, butter, and herbs.",
      imagpath: "lib/User_panel/screens/splash_screens/salada/sides/sides1.jpg",
      price: 2.99,
      category: FoodCategory.sides,
    ),
    Food(
      name: "French Fries",
      "Crispy golden fries served with ketchup.",
      imagpath: "lib/User_panel/screens/splash_screens/salada/sides/sides2.jpg",
      price: 2.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: "Onion Rings",
      "Crispy battered onion rings served with dipping sauce.",
      imagpath: "lib/User_panel/screens/splash_screens/salada/sides/sides3.jpg",
      price: 3.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: "Mozzarella Sticks",
      "Fried mozzarella sticks with marinara sauce.",
      imagpath: "lib/User_panel/screens/splash_screens/salada/sides/sides4.jpg",
      price: 4.49,
      category: FoodCategory.sides,
    ),
    Food(
      name: "Coleslaw",
      "Creamy coleslaw with a tangy dressing.",
      imagpath: "lib/User_panel/screens/splash_screens/salada/sides/sides5.jpg",
      price: 1.99,
      category: FoodCategory.sides,
    ),

    //desserts
    Food(
      name: "Chocolate Cake",
      "Rich and moist chocolate cake topped with chocolate ganache.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/desserts/desserts1.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Cheesecake",
      "Classic New York cheesecake with a graham cracker crust.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/desserts/desserts2.jpg",
      price: 5.49,
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Apple Pie",
      "Traditional apple pie with a buttery crust and spiced apple filling.",
      imagpath: "lib/screens/splash_screens/salada/desserts/desserts3.jpg",
      price: 3.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Tiramisu",
      "Layered Italian dessert with mascarpone cheese and espresso-soaked ladyfingers.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/desserts/desserts4.jpg",
      price: 5.99,
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Brownies",
      "Fudgy chocolate brownies served with or without nuts.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/desserts/desserts5.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
    ),

    //drinks

    Food(
      name: "Lemonade",
      "Freshly squeezed lemonade with a hint of mint.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/drinks/drinks1.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
    ),
    Food(
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/drinks/drinks2.jpg",
      "Chilled coffee served with milk and sugar.",
      name: "Iced Coffee",
      price: 3.49,
      category: FoodCategory.drinks,
    ),
    Food(
      "Hot brewed green tea with a soothing aroma.",
      imagpath:
          "lib/User_panel/screens/splash_screens/salada/drinks/drinks3.jpg",
      name: "Green Tea",
      price: 1.99,
      category: FoodCategory.drinks,
    ),
  ];

  List<Food> get menu => _menu;

  List<CartItem> get cartItems => _cartItems;
  final List<CartItem> _cartItems = [];

  void addToCart(Food food) {
    CartItem? existingCartItem = _cartItems.firstWhereOrNull((cartItem) {
      return cartItem.food.name == food.name;
    });

    if (existingCartItem == null) {
      _cartItems.add(CartItem(food: food));
    }

    notifyListeners();
  }

  List<CartItem> get cartItems1 => _cartItems1;
  final List<CartItem> _cartItems1 = [];

  void addToCart1(Food food) {
    CartItem? existingCartItem = _cartItems1.firstWhereOrNull((cartItem) {
      return cartItem.food.name == food.name;
    });

    if (existingCartItem != null) {
      existingCartItem.increament();
    } else {
      _cartItems1.add(CartItem(food: food));
    }

    rebuildUi();
  }

  void removedFromCart(CartItem cartItem, BuildContext context) {
    int cartIndex = _cartItems1.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cartItems1[cartIndex].quantitty > 1) {
        _cartItems1[cartIndex].quantitty--;
      } else {
        _cartItems1.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  void removedFromCart1(CartItem cartItem1) {
    int cartIndex = _cartItems.indexOf(cartItem1);
    if (cartIndex != -1) {
      if (_cartItems[cartIndex].quantitty >= 1) {
        _cartItems.removeAt(cartIndex);
      } else {}
      notifyListeners();
    }
  }

  @override
  notifyListeners();

  void clearCart() {
    _cartItems1.clear();
    rebuildUi();
  }

  void clearCart1() {
    _cartItems.clear();
    rebuildUi();
  }

  double getTotalprice() {
    double itemtotal = 0.0;
    for (CartItem cartItem in _cartItems1) {
      double totalprice = cartItem.food.price;
      itemtotal += totalprice * cartItem.quantitty;
    }
    return itemtotal;
  }

  getTotalItemCount() {
    int totalItemcount = 0;
    for (CartItem cartItem in _cartItems1) {
      totalItemcount += cartItem.quantitty;
    }
    return totalItemcount;
  }

  displayCartReceipt() {
    final receipt = <dynamic, dynamic>{};

    final _firebaseAuth = FirebaseAuth.instance.currentUser?.email;
    if (_firebaseAuth != null) {
      final firebaseAuth = _firebaseAuth.split('@')[0];
      receipt['Name'] = (firebaseAuth);
    }
    receipt['date'] = DateFormat("yyyy-MM-dd / HH:mm").format(DateTime.now());
    receipt['items'] = [];

    if (_cartItems1.isEmpty) {
      print("Cart is empty.");
    } else {
      for (final CartItem in _cartItems1) {
        receipt['items'].add({
          'name': CartItem.food.name,
          'quantity': CartItem.quantitty,
          'price': CartItem.food.price,
        });
      }
    }

    receipt['totalItems'] = getTotalItemCount();
    receipt['totalPrice'] = _formatprice(getTotalprice());
    receipt['deliveryAddress'] = delevoryAddress;
    receipt['Email'] = _firebaseAuth ?? "Not provided";
    return receipt;
  }

  String _formatprice(double price) {
    return ("\$${price.toStringAsFixed(2)}");
  }

  String _delevoryAddress = 'Delivory Address:';
  String get delevoryAddress => _delevoryAddress;

  void updatedelivoryaddress(String newAddress) {
    _delevoryAddress = newAddress;
    rebuildUi();
  }
}
