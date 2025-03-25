import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Contorller.dart';
import 'package:stacked/stacked.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersModel>.reactive(
      viewModelBuilder: () => UsersModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Obx(() {
              return Text(
                'All Users ${viewModel.getcontroller.usercollectionlength.toString()}',
              );
            }),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: viewModel.buildUserList(),
        );
      },
    );
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UsersModel extends BaseViewModel {
  final Contorller getcontroller = Get.put(Contorller());
  Stream<QuerySnapshot> getUserstream() {
    return _firestore.collection('users').snapshots();
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
            subtitle: Text(data["email"] ?? "No Email"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data["Names"] ?? "No Email"),
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
