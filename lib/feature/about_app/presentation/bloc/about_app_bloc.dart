import 'package:Thimar/feature/about_app/data/model/response/about_app_response_model/about_app_response_model.dart';
import 'package:Thimar/feature/about_app/data/repo/about_app_repo.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_event.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_state.dart';
import 'package:bloc/bloc.dart';

class AboutAppBloc extends Bloc<AboutAppEvent, AboutAppState> {
  AboutAppBloc() : super(AboutAppInitial()) {
    on<ShowAboutApp>(aboutApp);
  }

  AboutAppResponseModel? aboutAppResponseModels;

  Future<void> aboutApp(ShowAboutApp event, Emitter<AboutAppState> emit) async {
    emit(AboutAppLoadingState());

    await AboutAppRepo.aboutAppRepo().then((value) {
      if (value != null) {
        aboutAppResponseModels = value;
        emit(AboutAppSuccessState());
      } else {
        emit(AboutAppErrorState());
      }
    });
  }
}
