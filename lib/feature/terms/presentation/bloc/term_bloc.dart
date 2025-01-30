import 'package:Thimar/feature/terms/data/model/response/term_response_model/term_response_model.dart';
import 'package:Thimar/feature/terms/data/repo/term_repo.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_event.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_state.dart';
import 'package:bloc/bloc.dart';

class TermBloc extends Bloc<TermEvent, TermState> {
  TermBloc() : super(TermInitial()) {
    on<ShowTermEvent>(showTerm);
  }

  TermResponseModel? termResponseModel;

  Future<void> showTerm(ShowTermEvent event, Emitter<TermState> emit) async {
    emit(TermLoadingState());

    await TermRepo.termRepo().then((value) {
      if (value != null) {
        termResponseModel = value;
        emit(TermSuccessState());
      } else {
        emit(TermErrorState());
      }
    });
  }
}
