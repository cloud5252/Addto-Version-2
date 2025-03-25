import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybekkar/User_panel/screens/Profile/Components/My_textbox.dart';
import 'package:mybekkar/User_panel/screens/Profile/Components/profile_image_edit.dart';
import 'package:mybekkar/User_panel/screens/Profile/profile_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viemodel, child) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.blue.shade200,
              body: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(viemodel.currentuser.email)
                    .snapshots(),
                builder: (context, snashot) {
                  if (snashot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snashot.hasError) {
                    return Center(
                      child: Text('Error: ${snashot.error}'),
                    );
                  } else if (snashot.hasData) {
                    final userdata =
                        snashot.data?.data() as Map<String, dynamic>?;
                    if (userdata == null) {
                      return const Center(
                        child: Text("No data found"),
                      );
                    }

                    return ListView(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const ProfileImageEdit(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          viemodel.currentuser.email!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade900),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Center(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        MyTextBox(
                          text: userdata['username'] ?? 'No Username',
                          userName: 'Username',
                          pressed: () =>
                              viemodel.editfield(context, 'username'),
                        ),
                        MyTextBox(
                          text: userdata['bio'] ?? 'No Bio',
                          userName: 'Bio',
                          pressed: () => viemodel.editfield(context, 'bio'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "My post",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Positioned(
              left: 5,
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ),
          ],
        );
      },
    );
  }
}
