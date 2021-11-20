import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/shared/networks/cubit/mode_cubit/mode_states.dart';
import 'package:restarant_app/shared/networks/local/cash_helper/cash_helper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() : super(InitilialsModeState());
  static ModeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.saveData(key: 'isDark', value: isDark)
          .then((value) => emit(ChangeModeState()));

      emit(ChangeModeState());
    }
  }
}
