import 'package:flutter/material.dart';

import 'My_Add_buttons.dart';

class MyNewCollection extends StatelessWidget {
  final String text;

  const MyNewCollection({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(

          // gradient: const LinearGradient(
          //   colors: [Colors.black54, Colors.white12],
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          // ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0.0, 0.0),
          //     color: Colors.black,
          //     blurRadius: 15,
          //     spreadRadius: 0.0,
          //   ),
          //   BoxShadow(
          //     offset: Offset(0.0, 0.0),
          //     blurRadius: 15,
          //     spreadRadius: 0.1,
          //   ),
          // ],
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade300,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButtonss(
                        text: "Explore",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue.shade300, width: 1),
                  ),
                  height: 110,
                  width: 110,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Transform.scale(
                      scale: 1.1,
                      child: Image.asset(
                        "lib/User_panel/screens/splash_screens/salada/burgers/burger2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
