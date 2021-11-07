import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restarant_app/models/restarant_user_model/user_model.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/states.dart';

class SignUpCubit extends Cubit<RestarantSignUpStates> {
  SignUpCubit() : super(RestarantSignUpInilialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  void createUser({
    required name,
    required String email,
    required phone,
    required String uId,
  }) {
    RestarantUserModel restarantUserModel = RestarantUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        image: 'assets/p.jpg',
        cover: 'assets/b.jpg');
  }

  void UserSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(RestarantSignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('The usr is sign up ${value.user}');
      //createUser(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((onError) {
      print('sign up error is${onError.toString}');
      emit(RestarantSingUpErrorState(error: onError));
    });
  }
}
