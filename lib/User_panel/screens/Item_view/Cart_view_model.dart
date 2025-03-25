import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Food.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final retorent = locator<Saller>();
  void addToCart1(Food food, BuildContext context) {
    final retorent = locator<Saller>();
    retorent.addToCart(food);
    Navigator.pop(context);
  }

  void addToCart(Food food, BuildContext context) {
    final retorent = locator<Saller>();
    retorent.addToCart1(food);

    Navigator.pop(context);
  }
  // final CounterService counterService = locator<CounterService>();

  // void addToCart(Food item) {
  //   counterService.addToCart(item);
  //   notifyListeners();
  // }

  double rating = 1.5;
  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate the Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 40.0,
                allowHalfRating: true,
                updateOnDrag: true,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_dissatisfied_outlined,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.green,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.blue,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_dissatisfied_rounded,
                        color: Colors.yellow,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_dissatisfied_rounded,
                        color: Colors.green,
                      );
                    default:
                      return Text('');
                  }
                },
                onRatingUpdate: (ratingw) {
                  this.rating = ratingw;
                  rebuildUi();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
