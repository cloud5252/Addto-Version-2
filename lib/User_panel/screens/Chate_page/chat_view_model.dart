import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Fire_base_service/auth_service.dart';
import '../Service/Auth/chat_services.dart';

class ChatPageViewModel extends BaseViewModel {
  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _messagesController = TextEditingController();
  final String receiverID;
  ValueNotifier<String> textValueNotifier = ValueNotifier<String>("");
  ChatPageViewModel({required this.receiverID});

  void onTextChanged(String text) {
    textValueNotifier.value = text;
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'tel',
    path: '1234567890',
  );

  void callnumber() async {
    await launchUrl(emailLaunchUri);
  }

  void signOut() {
    _authServices.signOut();
  }

  void sendMessages() {
    if (_messagesController.text.isNotEmpty) {
      _chatService.sendMessages(
        _messagesController.text,
        receiverID,
      );
      _messagesController.clear();
      textValueNotifier.value = "";
    }
  }

  Widget buildMessageList() {
    String? senderID = _authServices.getcurrentuser()?.uid;

    if (senderID == null) {
      return Center(child: Text("User not found"));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          reverse: false,
          children: snapshot.data!.docs
              .map((document) => buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    String currentUserId = _firebaseAuth.currentUser!.uid;

    var alignment = (data["senderId"] == currentUserId)
        ? Alignment.topRight
        : Alignment.topLeft;

    var backgroundColor = (data["senderId"] == currentUserId)
        ? Colors.greenAccent.shade100
        : const Color.fromARGB(255, 247, 245, 245);

    String time = "";
    if (data["timestamp"] != null) {
      time = _chatService.formatTimestamp(data["timestamp"]);
    }

    Widget checkmark =
        (data["senderId"] == currentUserId && data["status"] != null)
            ? buildMessageStatus(data["status"])
            : SizedBox();

    return messagdecuration(data, alignment, backgroundColor, checkmark, time);
  }

  Widget messagdecuration(Map<String, dynamic> data, Alignment alignmentt,
      Color backgroundColor, Widget checkmark, String time) {
    return Row(
      mainAxisAlignment: alignmentt == Alignment.topRight
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: alignmentt,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, bottom: 10, top: 5),
                      child: Text(
                        data['message'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 10,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                checkmark,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMessageStatus(String? status) {
    if (status == "sent") {
      return Icon(Icons.check,
          color: const Color.fromARGB(255, 71, 170, 250), size: 16);
    } else if (status == "delivered") {
      return Icon(Icons.done_all, color: Colors.white, size: 16);
    } else if (status == "seen") {
      return Icon(Icons.done_all, color: Colors.blue, size: 16);
    } else {
      return SizedBox();
    }
  }

  Widget buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: textValueNotifier,
              builder: (context, text, _) {
                return TextField(
                  controller: _messagesController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Write Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (text) {
                    onTextChanged(text);
                  },
                );
              },
            ),
          ),
          IconButton(
            onPressed: sendMessages,
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                color: Colors.grey.shade100,
              ),
              height: 40,
              width: 40,
              child: textValueNotifier.value.isEmpty
                  ? Icon(
                      Icons.mic,
                      size: 30,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.blue,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
