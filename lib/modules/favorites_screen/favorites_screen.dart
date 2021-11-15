import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Card(
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/Menus/popular_food/popular1.png'),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('رز مع الدجاج',
                                style: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              child: RatingBar.builder(
                                itemSize: 14,
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.red[200],
                                ),
                                onRatingUpdate: (rating) {
                                  // print(rating);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '220ريال',
                              style: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red[100],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              child: Icon(
                                Icons.shopping_cart_sharp,
                                size: 20,
                                color: Colors.red[100],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                ),
            itemCount: 3),
      ),
    );
  }
}
