import 'package:Thimar/feature/policy/data/model/response/policy_response_model/policy_response_model.dart';
import 'package:Thimar/feature/policy/data/repo/policy_repo.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_event.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_state.dart';
import 'package:bloc/bloc.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyInitial()) {
    on<ShowPolicyEvent>(showPolicy);
  }
  PolicyResponseModel? showPolicyResponseModels;
  Future<void> showPolicy(PolicyEvent event, Emitter<PolicyState> emit) async {
    emit(PolicyLoading());
    await PolicyRepo.showPolicyRepo().then((value) {
      if (value != null) {
        showPolicyResponseModels = value;
        emit(PolicySuccess());
      } else {
        emit(PolicyError());
      }
    });
  }
}
