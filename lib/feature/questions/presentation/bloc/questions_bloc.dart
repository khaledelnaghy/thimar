import 'package:Thimar/feature/questions/data/models/response/show_question_response_model/show_question_response_model.dart';
import 'package:Thimar/feature/questions/data/repo/questions_repo.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_event.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_state.dart';
import 'package:bloc/bloc.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsInitial()) {
    on<ShowQuestionEvevnt>(showQuestion);
  }

  ShowQuestionResponseModel? showQuestionResponseModels;

  Future<void> showQuestion(
      ShowQuestionEvevnt event, Emitter<QuestionsState> emit) async {
    emit(QuestionsLoading());
    await QuestionsRepo.showQuestionRepo().then((value) {
      if (value != null) {
        showQuestionResponseModels = value;
        emit(QuestionsSuccess());
      } else {
        emit(QuestionsError());
      }
    });
  }
}
