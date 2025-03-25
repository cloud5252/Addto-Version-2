import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderemail;
  final String receiverId;
  final String message;
  final Timestamp? timestamp;
  final String status;

  Message({
    required this.senderId,
    required this.senderemail,
    required this.receiverId,
    required this.message,
    this.timestamp,
    this.status = "sent",
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderemail': senderemail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'status': status,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] ?? '',
      senderemail: map['senderemail'] ?? '',
      receiverId: map['receiverId'] ?? '',
      message: map['message'] ?? '',
      timestamp: map['timestamp'],
      status: map['status'] ?? 'sent',
    );
  }
}
