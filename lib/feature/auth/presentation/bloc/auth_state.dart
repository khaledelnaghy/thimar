
class AuthState {}

class AuthInitial extends AuthState {}

//register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String errorMesaage;

  RegisterErrorState({required this.errorMesaage});
}

// login

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String errorMesaage;
  LoginErrorState({required this.errorMesaage});
}

//forget password

class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {}

//cheek code
class CheckCodeLoadingState extends AuthState {}

class CheckCodeSuccessState extends AuthState {}

//verify
class VerifyLoadingState extends AuthState {}

class VerifySuccessState extends AuthState {
  // final RegisterResponseModel? data;

  // VerifySuccessState(this.data);
}

class VerifyErrorState extends AuthState {
  final String errorMesaage;

  VerifyErrorState({required this.errorMesaage});
}
