import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/shared/networks/cubit/cubit.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: Container(
              color: Colors.white,
              width: 50,
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 16),
                    child: Text(
                      'اجمالي المبلغ :                 100',
                      style: TextStyle(
                          color: Colors.red[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red[200],
                        onPressed: () {},
                        child: Text(
                          'ادفع الان',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                              fontFamily: 'Cairo'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body:
                /*Center(
                    child: Text('لايوجد طلبات',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.red[300])),
                  )*/
                Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      // itemExtent: 40,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, left: 6, right: 6, top: 12),
                          child: Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //   mainAxisAlignment:
                                    //    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 45,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.red[100]!),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: InkWell(
                                              child: Icon(
                                                Icons.arrow_upward,
                                                size: 22,
                                                color: Colors.red[100],
                                              ),
                                              onTap: () {},
                                            )),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Expanded(
                                                child: Text(
                                              3.toString(),
                                              style: TextStyle(
                                                color: Colors.red[200],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                child: Icon(
                                                  Icons.arrow_downward,
                                                  size: 22,
                                                  color: Colors.red[100],
                                                ),
                                                onTap: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(''),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "رز مع الدجاج".toString(),
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            300.toString(),
                                            style: TextStyle(
                                                color: Colors.red[600],
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo'),
                                          ),
                                        ],
                                      ),
                                      //SizedBox(width: 30,),
                                      Expanded(
                                        child: GestureDetector(
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Colors.red[100],
                                                )),
                                            onTap: () {
                                              AlertDialog(
                                                title: Text(
                                                    'هل انت متأكد من الغاء طلبك'),
                                                actions: [],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
