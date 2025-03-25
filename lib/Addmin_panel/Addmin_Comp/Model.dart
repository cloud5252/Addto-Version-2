import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final Timestamp? timestamp;
  final String? customerAddress;
  final dynamic customerEmail;
  final List<dynamic> isSale;
  final dynamic totalItems;
  final String producttotalprice;

  OrderModel({
    required this.timestamp,
    required this.customerAddress,
    required this.customerEmail,
    required this.isSale,
    required this.totalItems,
    required this.producttotalprice,
  });
}
