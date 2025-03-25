import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Addmin_Comp/Order/Order_view.dart';
import 'package:stacked/stacked.dart';

class OrderVewModel extends BaseViewModel {
  final String docId;
  OrderVewModel({required this.docId});
  Widget buildUserList() {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('orders')
          .doc(docId)
          .collection('customer')
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
                      onPressed: () {}, icon: Icon(Icons.info_outline)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data['Email']) // Show Name or 'No Name'
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderView(
                          customerName: data[''],
                          docId: data['uid'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
