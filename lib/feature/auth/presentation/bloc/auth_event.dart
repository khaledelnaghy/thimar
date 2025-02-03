import 'package:Thimar/feature/auth/data/models/request/login_params.dart';
import 'package:Thimar/feature/auth/data/models/request/register_params.dart';

class AuthEvent {}

//Params

//register
class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  RegisterEvent({required this.params});
}

//login
class LoginEvent extends AuthEvent {
  final LoginParams params;

  LoginEvent({required this.params});
}

//ForgetPasswordEvent
class ForgetPasswordEvent extends AuthEvent {
  final String phone;

  ForgetPasswordEvent({required this.phone});
}

//check code
class CheckCodeEvent extends AuthEvent {
  final String code;
  final String phone;
  final String phoneCode;
  CheckCodeEvent(
      {required this.code, required this.phone, required this.phoneCode});
}

//verifiy
class VerifiyEvent extends AuthEvent {
  final String code;
  final String phone;
  final String deviceToken;
  final String type;

  VerifiyEvent(
      {required this.code,
      required this.phone,
      required this.deviceToken,
      required this.type});
}
