import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/Sign_up/restarant_signup_cubit/states.dart';
import 'package:restarant_app/modules/Sign_up/sign_up.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class SignUpCubit extends Cubit<RestarantSignUpStates> {
  SignUpCubit() : super(RestarantSignUpInilialState());
  static SignUpCubit get(context) => BlocProvider.of(context);
}
