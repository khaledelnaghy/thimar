import 'package:Thimar/feature/profile/data/model/response/profile_response_model/profile_response_model.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ShowProfileLoading extends ProfileState {}

class ShowProfileSuccess extends ProfileState {
  final ProfileResponseModel? showPolicyResponseModels;
  ShowProfileSuccess({this.showPolicyResponseModels});
}

class ShowProfileError extends ProfileState {}

class LogOutLoadingState extends ProfileState {}

class LogOutSuccessState extends ProfileState {}
