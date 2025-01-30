import 'package:Thimar/feature/complaints_suggestions/data/model/request/common_suggestion_params.dart';

class CommonSuggestionEvent {}

class ShowCommonSuggestionEvent extends CommonSuggestionEvent {
  final SuggestionsParams params;

  ShowCommonSuggestionEvent({required this.params});
}
