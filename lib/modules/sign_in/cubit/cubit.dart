import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/sign_in/cubit/states.dart';

class SignInCubit extends Cubit<RestarantSignInStates> {
  SignInCubit() : super(RestarantSignInIntialState());
  static SignInCubit get(context) => BlocProvider.of(context);
}
