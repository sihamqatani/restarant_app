import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:restarant_app/layouts/restarant_layout.dart';

import 'package:restarant_app/modules/onBoarding/onBoarding_screen.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
//import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/constants/constants.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding();
  await CashHelper.init();
  //print('the onBoard$onBoard');
  late Widget startWidget;
  if (CashHelper.getData(key: 'onBoarding') == null) {
    startWidget = OnBoardingScreen();
  } else {
    startWidget = SignIn();
  }
  //onBoard = true;
  // onBoard = CashHelper.getData(key: 'onBoarding') as bool;
  print('the value of obard in main $onBoard');
  runApp(RestarantApp(
    startWidget: startWidget,
  ));
}

class RestarantApp extends StatelessWidget {
  Widget startWidget;
  // bool? onBoard;
  RestarantApp({
    required this.startWidget,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                actionsIconTheme: IconThemeData(color: Colors.red[100]),
                iconTheme: IconThemeData(color: Colors.black),
                backwardsCompatibility: false,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.red[100],
                elevation: 2,
                type: BottomNavigationBarType.fixed),
          ),
          home: startWidget),
      //RestarantLayout()), //OnBoardingScreen()), // RestarantLayout()),
    ); //onBoard! ? SignIn() : OnBoardingScreen());
  }
}
