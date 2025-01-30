import 'package:Thimar/feature/complaints_suggestions/data/model/response/common_suggestion_response_model.dart';
import 'package:Thimar/feature/complaints_suggestions/data/repo/common_suggestion_repo.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_event.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_state.dart';
import 'package:bloc/bloc.dart';

class CommonSuggestionBloc
    extends Bloc<CommonSuggestionEvent, CommonSuggestionState> {
  CommonSuggestionBloc() : super(ShowCommonSuggestionInitaial()) {
    on<ShowCommonSuggestionEvent>(showCommonSuggetstion);
  }
  CommonSuggestionResponseModel? commonSuggestionResponseModels;
  Future<void> showCommonSuggetstion(ShowCommonSuggestionEvent event,
      Emitter<CommonSuggestionState> emit) async {
    emit(ShowCommonSuggestionLoading());

    await CommonSuggestionRepo.commonSuggestionRepo(event.params).then((value) {
      if (value != null) {
        commonSuggestionResponseModels = value;
        emit(ShowCommonSuggestionSuccess());
      } else {
        emit(ShowCommonSuggestionError());
      }
    });
  }
}
