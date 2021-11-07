abstract class RestarantSignUpStates {}

class RestarantSignUpInilialState extends RestarantSignUpStates {}

class RestarantSignUpLoadingState extends RestarantSignUpStates {}

class RestarantSignUPSuccessState extends RestarantSignUpStates {
  final String uId;
  RestarantSignUPSuccessState({
    required this.uId,
  });
}

class RestarantSingUpErrorState extends RestarantSignUpStates {
  final String error;
  RestarantSingUpErrorState({
    required this.error,
  });
}

class RestarantCreateUserErrorState extends RestarantSignUpStates {}

class RestarantCreateUserSuccessrState extends RestarantSignUpStates {}
