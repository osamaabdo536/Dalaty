

abstract class CreateCaseStates {}

class CreateCaseLoadingState extends CreateCaseStates {}

class CreateCaseErrorState extends CreateCaseStates {
  String? errorMessage;
  CreateCaseErrorState({required this.errorMessage});
}

class CreateCaseSuccessState extends CreateCaseStates {
}
