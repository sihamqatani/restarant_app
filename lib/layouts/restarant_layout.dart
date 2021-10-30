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
                bottomNavigationBar: BottomNavigationBar(
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
                ),
                body: cubit.screens[cubit.currentIndex],
              ));
        });
  }
}
