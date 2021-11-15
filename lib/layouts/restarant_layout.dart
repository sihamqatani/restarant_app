import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class RestarantLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = RestaurantCubit.get(context);
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.red[200]),
                  title: Text(
                    RestaurantCubit.get(context)
                        .titles[RestaurantCubit.get(context).currentIndex],
                    style:
                        TextStyle(color: Colors.grey[900], fontFamily: 'Cairo'),
                  ),
                ),
                bottomNavigationBar: BottomNavyBar(
                  iconSize: 20,
                  showElevation: true,
                  selectedIndex: cubit.currentIndex,
                  onItemSelected: (value) {
                    cubit.changeBottomNav(value);
                    cubit.pageViewController.animateToPage(cubit.currentIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  },
                  items: [
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.home),
                        title: Text('الرئيسية',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[300]!),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.shopping_cart),
                        title: Text('اطلب الآن',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.card_giftcard),
                        title: Text('العروض',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.favorite),
                        title: Text('مفضلاتي',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                    BottomNavyBarItem(
                        inactiveColor: Colors.grey,
                        icon: Icon(Icons.account_box),
                        title: Text('حسابي',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                        activeColor: Colors.red[200]!),
                  ],
                ),
                /*BottomNavigationBar(
                  onTap: (value) {
                    cubit.changeBottomNav(value);
                  },
                  currentIndex: cubit.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      //  activeIcon: ,
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'اطلب الآن',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard),
                      label: 'العروض',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'مفضلاتي',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box),
                      label: 'حسابي',
                    )
                  ],
                ),*/
                body: cubit.screens[cubit.currentIndex],
              ));
        });
  }
}
