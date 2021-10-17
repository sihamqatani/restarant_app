import 'package:bloc/bloc.dart';
import 'package:restarant_app/shared/networks/cubit/states.dart';

class RestaurantCubit extends Cubit<RestaurantStates> {
  RestaurantCubit() : super(RestaurantInitialState());
}
