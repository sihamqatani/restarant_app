import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/cubit.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/states.dart';
import 'package:restarant_app/modules/sign_in/sign_in.dart';
import 'package:restarant_app/shared/components/components.dart';

class SignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  late var emailController = TextEditingController();
  late var passwordController = TextEditingController();
  late var nameController = TextEditingController();
  late var phoneController = TextEditingController();
  Widget drawLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'حسابي',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, RestarantSignUpStates>(
        listener: (context, state) {
      if (state is RestarantSignUPSuccessState) {
        navigateAndFinish(context, SignIn());
        showToast(state: ToastColorstate.SUCCESS, message: 'تم التسجيل بنجاح');
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          drawLogo(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      // borderRadius: BorderRadius.only(
                                      //topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "تسجيل",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black54,
                                                        fontFamily: 'Cairo'),
                                                  ),
                                                ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Expanded(
                                              child: defaultFormField(
                                                controller: nameController,
                                                type: TextInputType.name,
                                                validate: (value) {
                                                  if (value!.isEmpty)
                                                    return 'الرجاء ادخل اسمك';
                                                },
                                                label: 'ادخل اسمك',
                                                prefix: Icons.face,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: defaultFormField(
                                              controller: emailController,
                                              type: TextInputType.emailAddress,
                                              validate: (value) {
                                                if (value!.isEmpty)
                                                  return 'ادخل بريدك';
                                              },
                                              label: 'ادخل بريدك',
                                              prefix: Icons.email,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: defaultFormField(
                                                  controller:
                                                      passwordController,
                                                  type: TextInputType
                                                      .visiblePassword,
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'ادخل كلمة المرور';
                                                    }
                                                  },
                                                  label: 'ادخل كلمة المرور',
                                                  prefix: Icons.lock)),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: defaultFormField(
                                                  controller: phoneController,
                                                  type: TextInputType.phone,
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'ادخل رقم الهاتف';
                                                    }
                                                  },
                                                  label: 'ادخل كلمة المرور',
                                                  prefix: Icons.phone,
                                                  onSubmit: (value) {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      print('done');
                                                      SignUpCubit.get(context)
                                                          .UserSignUp(
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text,
                                                              name:
                                                                  nameController
                                                                      .text,
                                                              phone:
                                                                  phoneController
                                                                      .text);
                                                    }
                                                  })),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              child: Conditional.single(
                                                  context: context,
                                                  conditionBuilder: (context) =>
                                                      state
                                                          is! RestarantSignUpLoadingState,
                                                  widgetBuilder: (context) {
                                                    return MaterialButton(
                                                      height: 1.4 *
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              20),
                                                      minWidth: 5 *
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              10),
                                                      color: Colors.red[200],
                                                      child: Text(
                                                        'تسجيل',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            fontFamily:
                                                                'Cairo'),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      onPressed: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          SignUpCubit.get(context).UserSignUp(
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text,
                                                              name:
                                                                  nameController
                                                                      .text,
                                                              phone:
                                                                  phoneController
                                                                      .text);
                                                        }
                                                      },
                                                    );
                                                  },
                                                  fallbackBuilder: (context) =>
                                                      Center(
                                                        child: Container(
                                                            height: 100,
                                                            width: 100,
                                                            child:
                                                                loadingIndicator()),
                                                      )),
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ]),
                          //drawButtom(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
