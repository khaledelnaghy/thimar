import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/auth/data/repo/auth_repo.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_event.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<ForgetPasswordEvent>(forgotPassword);
    on<CheckCodeEvent>(cheekCode);
    on<VerifiyEvent>(verifiyData);
  }
  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
//api

    await AuthRepo.registerRepo(event.params).then((value) {
      if (value != null) {
        // LocalStorage.cacheData(
        //     key: LocalStorage.token, value: value.data?.token);
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState(
          errorMesaage: "Something went wrong",
        ));
      }
    });
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    //api
    await AuthRepo.loginRepo(event.params).then(
      (value) {
        if (value != null) {
          LocalStorage.cacheData(
              key: LocalStorage.token, value: value.data?.token);

          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState(errorMesaage: "Something went wrong"));
        }
      },
    );
  }

  Future<void> forgotPassword(
      ForgetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(ForgetPasswordLoadingState());
    //api
    await AuthRepo.forgetPasswordRepo(event.phone).then(
      (value) {
        if (value == true) {
          // LocalStorage.cacheData(
          //     key: LocalStorage.token, value: value.data?.token);
          emit(ForgetPasswordSuccessState());
        } else {
          emit(LoginErrorState(errorMesaage: ""));
        }
      },
    );
  }

  Future<void> cheekCode(CheckCodeEvent event, Emitter<AuthState> emit) async {
    emit(CheckCodeLoadingState());
    //api
    await AuthRepo.checkCodeRepo(event.code, event.code, event.phoneCode).then(
      (value) {
        if (value != null) {
          // LocalStorage.cacheData(
          //     key: LocalStorage.token, value: value.data?.token);
          emit(CheckCodeSuccessState());
        } else {
          emit(LoginErrorState(errorMesaage: "something went wrong"));
        }
      },
    );
  }

  static Future<void> verifiyData(
      VerifiyEvent event, Emitter<AuthState> emit) async {
    emit(VerifyLoadingState());
    print(
        "Phone: ${event.phone}, Code: ${event.code}, Type: ${event.type}, Device Token: ${event.deviceToken}");
    await AuthRepo.verifiyCodoRepo(
            event.phone, event.code, event.type, event.deviceToken)
        .then((value) {
      if (value != null) {
        LocalStorage.cacheData(
            key: LocalStorage.token, value: value.data?.token);
        emit(VerifySuccessState());
      } else {
        emit(VerifySuccessState());
      }
    });
  }
}


      // String? token = await LocalStorage.getData(key: LocalStorage.token);

      // if (token != null) {
      //   LocalStorage.cacheData(key: LocalStorage.token, value: token);
      // }