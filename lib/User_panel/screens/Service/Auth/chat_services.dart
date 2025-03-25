import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybekkar/User_panel/screens/Chate_page/chat_view.dart';
import 'package:mybekkar/User_panel/screens/Service/Auth/model.dart';
import 'package:stacked/stacked.dart';

class ChatService extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SEND MESSAGE
  Future<void> sendMessages(String message, String receiverId) async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    String currentUseremail = FirebaseAuth.instance.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message newMessage = Message(
      senderId: currentUserId,
      senderemail: currentUseremail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
      status: "sent",
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join('_');
    //  'timestamp': FieldValue.serverTimestamp(),

    // Save Message to Firestore under this conversation
    await _firestore
        .collection("chat_room")
        .doc(chatroomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatroomIds = ids.join('_');

    return _firestore
        .collection('chat_room')
        .doc(chatroomIds)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserstream() {
    return _firestore.collection('users').snapshots();
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('hh:mm a').format(dateTime); // Example: 02:30 PM
  }

  // buildUserList function
  Widget buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: getUserstream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text("Kuch galat ho gaya hai. Dobara koshish karein."));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final userdata = docs[index];
            return _buildUserListItem(userdata, context);
          },
        );
      },
    );
  }

  // buildUserListItem function
  Widget _buildUserListItem(DocumentSnapshot userdata, BuildContext context) {
    final data = userdata.data() as Map<String, dynamic>?;

    if (data == null || data["Names"] == null) {
      return const SizedBox.shrink();
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null || currentUser.email == data["email"]) {
      return const SizedBox.shrink();
    }

    List<String> ids = [currentUser.uid, data["uid"]];
    ids.sort();
    String chatRoomId = ids.join('_');

    print("🔥 User Data: ${jsonEncode(data)}");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.white70,
        elevation: 1.0,
        child: InkWell(
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data["Names"] ?? "No Email"),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('chat_room')
                      .doc(chatRoomId)
                      .collection('messages')
                      .orderBy('timestamp', descending: true)
                      .limit(1)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
                    if (snapshot.hasError) {
                      return const Text("Error loading last message");
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text("");
                    }

                    print(
                        "💬 Last Message Data: ${snapshot.data!.docs.first.data()}");

                    Timestamp timestamp =
                        snapshot.data!.docs.first['timestamp'];
                    String formattedTime = formatTimestamp(timestamp);

                    return Text(
                      formattedTime,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    );
                  },
                ),
              ],
            ),
            subtitle: Row(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('chat_room')
                      .doc(chatRoomId)
                      .collection('messages')
                      .orderBy('timestamp', descending: true)
                      .limit(1)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
                    if (snapshot.hasError) {
                      return const Text("Error loading last message");
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text("No messages yet");
                    }

                    // ✅ Real-time Message Data Print Karna
                    var lastMessage = snapshot.data!.docs.first['message'];
                    print("🆕 Real-time Message: $lastMessage");

                    String truncatedMessage = lastMessage.length > 30
                        ? lastMessage.substring(0, 20) + '...'
                        : lastMessage;

                    return Text(
                      truncatedMessage,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPagee(
                    receiveremail: data['email'],
                    receiverID: data['uid'],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
