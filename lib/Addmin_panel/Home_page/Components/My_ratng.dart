import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:stacked/stacked.dart';

class MyRatngg extends StatelessWidget {
  const MyRatngg({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomrViewModeladdminn>.nonReactive(
      viewModelBuilder: () => HomrViewModeladdminn(),
      builder: (context, viewmodel, child) {
        return RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        );
      },
    );
  }
}
