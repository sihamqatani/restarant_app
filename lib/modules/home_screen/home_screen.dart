import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restarant_app/models/catoregy/catogrey_model.dart';
import 'package:restarant_app/models/food_details_model.dart/food_details_model.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  List<Cateorgy> menuType = [
    Cateorgy('برجر', 'assets/Images/Menus/burger.png'),
    Cateorgy('بيتزا', 'assets/Images/Menus/pizza-slice.png'),
    Cateorgy('ايسكريم', 'assets/Images/Menus/ice-cream.png'),
    Cateorgy('لحم', 'assets/Images/Menus/meat.png'),
    Cateorgy('معجنات', 'assets/Images/Menus/croissant.png'),
    Cateorgy('دجاج', 'assets/Images/Menus/chicken-leg.png'),
    Cateorgy('سباجيتي', 'assets/Images/Menus/noodles.png'),
    Cateorgy('مشروبات', 'assets/Images/Menus/cola.png'),
    Cateorgy('أرز', 'assets/Images/Menus/rice.png'),
  ];
  List<FoodDetails> foodDetails = [
    FoodDetails(
        name: 'رزمع الدجاج ',
        imageUrl: 'assets/Images/Menus/popular_food/popular2.png',
        noRating: 1.1,
        price: 20),
    FoodDetails(
        name: 'برياني ',
        imageUrl: 'assets/Images/Menus/b.png',
        noRating: 1.9,
        price: 30),
    FoodDetails(
        name: 'برجركلاسيكي ',
        imageUrl: 'assets/Images/Menus/b.png',
        noRating: 1.5,
        price: 25),
    FoodDetails(
        name: 'بيتزا ',
        imageUrl: 'assets/Images/Menus/p.png',
        noRating: 2.5,
        price: 60),
  ];
  List imageSlider = [
    'assets/Images/Menus/p.png',
    'assets/Images/Menus/b.png',
    'assets/Images/Menus/b.png'
  ];
  Widget popularFoodMenu(BuildContext ctx) {
    //var rating;
    return Container(
      // color: Colors.white,
      height: 440,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
            child: Container(
              alignment: Alignment.topRight,
              child: Text('الوجبات الاكثر طلبا',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 22,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            height: 350,
            padding: EdgeInsets.only(right: 8, left: 8),
            width: MediaQuery.of(ctx).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 200,
              itemCount: foodDetails.length,
              itemBuilder: (context, index) => Container(
                height: 400,
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Stack(
                    children: [
                      Align(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 25,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.only(bottom: 100),
                          width: double.infinity,
                          height: 350,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                foodDetails[index].imageUrl,
                                // 'assets/Images/Menus/popular_food/popular1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 210, right: 22),
                              child: Text(
                                foodDetails[index].name,
                                //'ستيك لحم مع الخضار',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 18,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Align(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    //foodDetails[index].no_rating.toString(),
                                    '(1.9)',
                                    //  Provider.of<Cart>(context, listen:true )
                                    //       .meal.length

                                    //  .toString(),
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 22),
                                  ),
                                  Container(
                                    child: RatingBar.builder(
                                      itemSize: 20,
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
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${foodDetails[index].price.toString()}ريال',
                                  // '\$12 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red[200],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red[100],
                                    radius: 20,
                                    child: IconButton(
                                        iconSize: 20,
                                        color: Colors.white,
                                        icon: Icon(
                                          Icons.add,
                                        ),
                                        onPressed: () {
                                          // print();
                                          //  print(foodDetails.length);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //popularListItem(),
              //popularListItem(),
              // popularListItem(),
            ),
          )
        ],
      ),
    );
  }

  Widget topMenuPart(context, category) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 20),
        height: 100,
        width: MediaQuery.of(context).size.width,

        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => drawTopMenu(menuType[index]),
          //shrinkWrap: true,

          itemCount: menuType.length,
          itemExtent: 50,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget drawTopMenu(Cateorgy menuType) {
    return Container(
      // margin:EdgeInsets.symmetric(horizontal:5),
      child: Column(
        children: [
          Card(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 50,
                  height: 50,
                  child: Card(
                    elevation: 0,
                    /* shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),*/

                    child: Container(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Image.asset(menuType.imageUrl),
                      ),
                    ),
                  ),
                ),
              )),
          //SizedBox(width: 10,height: 10,),
          Text(
            menuType.name,
            style: TextStyle(
                color: Colors.grey[900], fontSize: 12, fontFamily: 'Cairo'),
          ),
        ],
      ),
    );
  }

  Widget searchPart() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'اكتب الوجبة التي تريدها',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[50]!),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red[100],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawTextSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.topRight,
        child: Text('الوجبات المتوفرةاليوم',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo')),
      ),
    );
  }

  Widget drawImageSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
          itemCount: imageSlider.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                    //  offset: new Offset(10.0, 10.0),
                  ),
                ],
              ),
              height: 200,
              // color: Colors.white,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                imageSlider[index],
                fit: BoxFit.fill,
              ),
            );
          },
          options: CarouselOptions(
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: true,
            // dotSize: 6.0,
            autoPlayInterval: Duration(seconds: 3),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => true,
              widgetBuilder: (context) {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        searchPart(),
                        topMenuPart(context, menuType),
                        drawTextSlider(),
                        drawImageSlider(),
                        popularFoodMenu(context),
                      ],
                    ),
                  ),
                );
              },
              fallbackBuilder: (context) =>
                  Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
