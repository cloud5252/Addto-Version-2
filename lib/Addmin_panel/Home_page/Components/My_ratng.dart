import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mybekkar/Addmin_panel/Home_page/homr_view_model.dart';
import 'package:stacked/stacked.dart';

class MyRatng extends StatelessWidget {
  const MyRatng({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomrViewModeladdmin>.nonReactive(
      viewModelBuilder: () => HomrViewModeladdmin(),
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
