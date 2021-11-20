//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/cubit.dart';
//import 'package:restarant_app/layouts/restarant_layout.dart';

import 'package:restarant_app/modules/onBoarding/onBoarding_screen.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
//import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_states.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  //print('the onBoard$onBoard');

  late Widget startWidget;
  if (CashHelper.getData(key: 'onBoarding') == null) {
    startWidget = OnBoardingScreen();
  } else {
    startWidget = SignIn();
  }
  late bool isDark;
  if (CashHelper.getData(key: 'isDark') != null) {
    isDark = CashHelper.getData(key: 'isDark');
  } else
    isDark = false;
  // = CashHelper.getData(key: 'isDark');
  //onBoard = true;
  // onBoard = CashHelper.getData(key: 'onBoarding') as bool;
  //print('the value of obard in main $onBoard');
  runApp(RestarantApp(
    startWidget: startWidget,
    isDark: isDark,
  ));
}

class RestarantApp extends StatelessWidget {
  Widget startWidget;
  //
  bool isDark;
  // bool? onBoard;
  RestarantApp({
    required this.startWidget,
    required this.isDark,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantCubit(),
        ),
        BlocProvider<ModeCubit>(
            create: (context) =>
                ModeCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Cairo',
                  focusColor: Colors.red[200],
                  primaryColor: Colors.red[200],
                  appBarTheme: AppBarTheme(
                      actionsIconTheme: IconThemeData(color: Colors.red[100]),
                      iconTheme: IconThemeData(color: Colors.red[200]),
                      backwardsCompatibility: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red[400]),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      // backgroundColor: Colors.black12,
                      unselectedItemColor: Colors.grey,
                      selectedItemColor: Colors.red[100],
                      elevation: 0,
                      selectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
                      type: BottomNavigationBarType.fixed),
                ),
                darkTheme: ThemeData(
                  fontFamily: 'Cairo',
                  focusColor: Colors.red[200],
                  primaryColor: Colors.red[200],
                  primaryColorDark: Colors.black12,
                  cardColor: Colors.black,
                  scaffoldBackgroundColor: Colors.grey[900],
                  primarySwatch: Colors.deepOrange,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange,
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
                  appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red[400]),
                      iconTheme: IconThemeData(color: Colors.white),
                      backwardsCompatibility: false,
                      backgroundColor: Colors.black12,
                      elevation: 0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black12,
                        statusBarIconBrightness: Brightness.light,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.grey[900],
                    elevation: 0,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.red[100],
                  ),
                ),
                themeMode: ModeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: startWidget);
          }),
    );
    //onBoard! ? SignIn() : OnBoardingScreen());
  }
}
