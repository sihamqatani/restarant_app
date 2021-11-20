import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/setting_screen/edit_user.dart';
import 'package:restarant_app/shared/components/components.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_cubit.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_states.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/89.jpg'),
                        radius: 38,
                      ),
                    ),
                  ),
                  Text(
                    'سهام عبدالله',
                    style: TextStyle(
                        fontSize: 20,
                        color: ModeCubit.get(context).isDark
                            ? Colors.white70
                            : Colors.red[200],
                        fontWeight: FontWeight.w900,
                        wordSpacing: 5,
                        letterSpacing: 3),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, bottom: 8, top: 8, left: 15),
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, EditUser());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.red[200],
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'تحديث البيانات الشخصية',
                            style: TextStyle(
                                color: ModeCubit.get(context).isDark
                                    ? Colors.white70
                                    : Colors.red[400],
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.red[200],
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'الوضع الليلي',
                          style: TextStyle(
                              color: ModeCubit.get(context).isDark
                                  ? Colors.white70
                                  : Colors.red[400],
                              fontSize: 18),
                        ),
                        Spacer(),
                        BlocConsumer<ModeCubit, ModeStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Switch(
                                  inactiveThumbColor: Colors.grey[100],
                                  activeColor: Colors.red[200],
                                  value: ModeCubit.get(context).isDark,
                                  onChanged: (value) {
                                    value = !value;
                                    print('now change00');
                                    print(value.toString());
                                    ModeCubit.get(context).changeAppMode();
                                  });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, bottom: 8, top: 8, left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.language_outlined,
                          color: Colors.red[200],
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'اللغه',
                          style: TextStyle(
                              color: ModeCubit.get(context).isDark
                                  ? Colors.white70
                                  : Colors.red[400],
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15, bottom: 8, top: 8, left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.red[200],
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                              color: ModeCubit.get(context).isDark
                                  ? Colors.white70
                                  : Colors.red[400],
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
