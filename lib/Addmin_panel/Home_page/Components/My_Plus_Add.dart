import 'package:flutter/material.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:stacked/stacked.dart';

class MyPlusAdd extends StatelessWidget {
  final Function()? onTap;
  const MyPlusAdd({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomrViewModeladdmin>.reactive(
      viewModelBuilder: () => HomrViewModeladdmin(),
      builder: (context, viewmodel, child) {
        return GestureDetector(
          onTap: onTap,
          child: ClipPath(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white70, Color.fromARGB(255, 3, 132, 238)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.2, 2.9]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(250),
                    bottomRight: Radius.circular(70)),
              ),
              height: 50,
              width: 50,
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
