import 'package:Thimar/feature/profile/data/model/response/profile_response_model/profile_response_model.dart';
import 'package:Thimar/feature/profile/data/repo/profile_repo.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_event.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_state.dart';
import 'package:bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ShowProfileEvent>(showProile);
    on<LogoutEvent>(logOut);
  }
  ProfileResponseModel? showPolicyResponseModels;

  Future<void> showProile(
      ShowProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ShowProfileLoading());

    //api
    await ProfileRepo.showProfileRepo().then((value) {
      if (value != null) {
        showPolicyResponseModels = value;
        emit(ShowProfileSuccess());
      } else {
        emit(ShowProfileError());
      }
    });
  }

  Future<void> logOut(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(LogOutLoadingState());
    await ProfileRepo.logOutRepo().then((value) {
      if (value == true) {
        emit(LogOutSuccessState());
      }
    });
  }
}
