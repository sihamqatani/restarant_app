import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:restarant_app/layouts/restarant_layout.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';

class FoodDetailsScreen extends StatelessWidget {
  String? image;
  String? name;
  dynamic rating;
  dynamic price;
  FoodDetailsScreen({
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
  });
  List<FoodDetails> foodDetails = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                // clipBehavior: Clip.antiAlias,
                // alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    color: ModeCubit.get(context).isDark
                        ? Colors.black
                        : Colors.red[100],
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 35, right: 5, left: 5),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, RestarantLayout());
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(image.toString())),
                    ),
                  ),
                  Positioned(
                    top: 230,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: ModeCubit.get(context).isDark
                            ? Colors.grey[900]
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    name.toString(),
                                    // foodDetails[index].name,
                                    // 'برجر لحم ',
                                    // 'ستيك لحم مع الخضار',
                                    style: TextStyle(
                                        color: Colors.red[400],
                                        wordSpacing: 3,
                                        fontSize: 25,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.red[200],
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('التقييم :',
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 20,
                                        color: ModeCubit.get(context).isDark
                                            ? Colors.white70
                                            : Colors.black,
                                      )),
                                  Spacer(),
                                  Container(
                                    child: RatingBar.builder(
                                      itemSize: 25,
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
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'يتكون من لحم بقري طازج محضر بأجود انواع التوابل مع صوص خاص يجعل مذاقه لايقاوم الصوص حار وبارد حسب ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ModeCubit.get(context).isDark
                                      ? Colors.white60
                                      : Colors.black,
                                ),
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(children: [
                                Text(
                                  ' ${price.toString()} ريال ',
                                  style: TextStyle(
                                      color: Colors.red[400],
                                      wordSpacing: 3,
                                      fontSize: 15,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.red[100]!),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: InkWell(
                                          child: Icon(
                                            Icons.add,
                                            size: 22,
                                            color: Colors.red[100],
                                          ),
                                          onTap: () {},
                                        )),
                                        Text(
                                          3.toString(),
                                          style: TextStyle(
                                            color: Colors.red[200],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            child: Icon(
                                              Icons.minimize,
                                              size: 22,
                                              color: Colors.red[100],
                                            ),
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: MaterialButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  color: Colors.red[200],
                                  onPressed: () {},
                                  child: Text(
                                    'اطلب الان',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        letterSpacing: 2,
                                        fontFamily: 'Cairo'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              )

                              // Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1)
            ],
          ),
        ),
      ),
    );
  }
}
