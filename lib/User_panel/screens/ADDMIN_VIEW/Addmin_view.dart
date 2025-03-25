import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Service/Auth/chat_services.dart';
import 'package:stacked/stacked.dart';

class AddminView extends StatelessWidget {
  const AddminView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatService>.reactive(
      viewModelBuilder: () => ChatService(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.blue.shade200,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade200,
            title: const Text("Admin Chat"),
            centerTitle: true,
          ),
          body: viewmodel.buildUserList(),
        );
      },
    );
  }
}
