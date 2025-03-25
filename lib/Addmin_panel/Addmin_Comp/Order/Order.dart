import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Contorller.dart';
import 'package:stacked/stacked.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersModel>.reactive(
      viewModelBuilder: () => UsersModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Obx(() {
              return Text(
                'All Oders ${viewModel.getcontrollers.usercollectionlength.toString()}',
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
  final Contorllers getcontrollers = Get.put(Contorllers());

  // Info dailog
  void showOrderDialog(BuildContext context, Map<String, dynamic> orderData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Date: ${orderData['date']}'),
                SizedBox(height: 10),
                // Displaying Items
                Text('Items:'),
                for (var item in orderData['items'])
                  Text(
                      "${item['quantity']} x ${item['name']} - \$${item['price']}"),
                SizedBox(height: 10),
                // Total Items and Total Price
                Text("Total Items: ${orderData['totalItems']}"),
                Text("Total Price: \$${orderData['totalPrice']}"),
                SizedBox(height: 10),
                // Delivery Address
                Text("Delivery Address: ${orderData['deliveryAddress']}"),
                Text("Delivery Address: ${orderData['Email']}"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // buildUserList function

  Widget buildUserList() {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('orders')
          .orderBy('Addmin', descending: true)
          .get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text("Kuch galat ho gaya hai. Dobara koshish karein."));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final userdata = snapshot.data!.docs[index];
            final data = userdata.data() as Map<String, dynamic>;
            return Card(
              color: Colors.white70,
              elevation: 1.0,
              child: InkWell(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  // subtitle: Text(userdata['Name'] ?? 'No Name'),
                  trailing: IconButton(
                      onPressed: () {
                        showOrderDialog(context, data);
                      },
                      icon: Icon(Icons.info_outline)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userdata['Email']) // Show Name or 'No Name'
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            );
          },
        );
      },
    );
  }

  // buildUserListItem function
  Widget _buildUserListItem(DocumentSnapshot userdata, BuildContext context) {
    final data = userdata.data() as Map<String, dynamic>?;

    if (data == null) {
      return const SizedBox.shrink();
    }

    final String userEmail = data["email"] ?? "No Email";
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null || currentUser.email == userEmail) {
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
            subtitle: Text(userEmail),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userEmail), // Show Name or 'No Name'
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  // buildUserListItem function
}
