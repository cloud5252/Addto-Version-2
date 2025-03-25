import 'package:flutter/material.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/ADDMIN_VIEW/Addmin_view.dart';
import 'package:mybekkar/User_panel/screens/Delevory_page/delevory_progress_model.dart';
import 'package:mybekkar/User_panel/screens/Fire_base_service/database/firestore.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:stacked/stacked.dart';

import 'Component/My_receipt.dart';

class DelevoryProgressView extends StatefulWidget {
  const DelevoryProgressView({super.key});

  @override
  State<DelevoryProgressView> createState() => _DelevoryProgressViewState();
}

class _DelevoryProgressViewState extends State<DelevoryProgressView> {
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();
    final receipt = locator<Saller>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DelevoryProgressModel>.reactive(
      viewModelBuilder: () => DelevoryProgressModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          backgroundColor: Colors.blue.shade200,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: _builbottomNabBar(context),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                MyReceipt(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _builbottomNabBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Junaid developer",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Driver",
                  style: TextStyle(color: Colors.grey.shade700),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddminView()));
                    },
                    icon: const Icon(Icons.message),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.call),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
