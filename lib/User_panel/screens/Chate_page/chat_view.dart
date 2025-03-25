import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Chate_page/chat_view_model.dart';
import 'package:stacked/stacked.dart';

class ChatPagee extends StatelessWidget {
  final String receiveremail;
  final String receiverID;
  ChatPagee({
    super.key,
    required this.receiveremail,
    required this.receiverID,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatPageViewModel>.reactive(
      viewModelBuilder: () => ChatPageViewModel(receiverID: receiverID),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.blue.shade200,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade200,
            title: Text(
              receiveremail,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.grey.shade100),
                height: 40,
                width: 40,
                child: IconButton(
                    onPressed: viewmodel.callnumber,
                    icon: const Icon(
                      Icons.call_outlined,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    color: Colors.grey.shade100),
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call_outlined,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: viewmodel.buildMessageList(),
              ),
              viewmodel.buildMessageInput(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
