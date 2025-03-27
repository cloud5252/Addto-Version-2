import 'package:cloud_firestore/cloud_firestore.dart';

class Foodd {
  final String foodId;
  final String foodImage;
  final String foodName;
  final DateTime createAt;
  final DateTime updataAt;
  final String category;
  final String Price;
  final String description;
  final int foodquentity;
  final double foodprice;

  // Constructor for the Food class
  Foodd({
    required this.foodId,
    required this.foodImage,
    required this.foodName,
    required this.createAt,
    required this.updataAt,
    required this.category,
    required this.Price,
    required this.description,
    required this.foodquentity,
    required this.foodprice,
  });

  factory Foodd.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Foodd(
      foodId: data['foodId'] ?? '',
      foodImage: data['foodImage'] ?? '',
      foodName: data['foodName'] ?? '',
      createAt: (data['createAt'] as Timestamp).toDate(),
      updataAt: (data['updateAt'] as Timestamp).toDate(),
      category: data['category'] ?? '',
      Price: data['Price'] ?? '',
      description: data['description'] ?? '',
      foodprice: data['foodprice'] ?? 0.0,
      foodquentity: data['foodquentity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'foodId': foodId,
      'foodImage': foodImage,
      'foodName': foodName,
      'createAt': createAt,
      'updateAt': updataAt,
      'category': category,
      'Price': Price,
      'description': description,
      'foodprice': foodprice,
      'foodquentity': foodquentity,
    };
  }

  factory Foodd.fromMap(Map<String, dynamic> map) {
    return Foodd(
      foodId: map['foodId'] ?? '',
      foodImage: map['foodImage'] ?? '',
      foodName: map['foodName'] ?? '',
      createAt: (map['createAt'] as Timestamp).toDate(),
      updataAt: (map['updateAt'] as Timestamp).toDate(),
      category: map['category'] ?? '',
      Price: map['Price'] ?? '',
      description: map['description'] ?? '',
      foodprice: map['foodprice'] ?? 0.0,
      foodquentity: map['foodquentity'] ?? 0,
    );
  }
}
