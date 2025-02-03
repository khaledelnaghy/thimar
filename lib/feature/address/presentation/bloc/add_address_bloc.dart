import 'package:Thimar/feature/address/data/model/response/add_address_response_model/add_address_response_model.dart';
import 'package:Thimar/feature/address/data/model/response/get_address/get_address_response_model/get_address_response_model.dart';
import 'package:Thimar/feature/address/data/repo/add_address_repo.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_event.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_state.dart';
import 'package:bloc/bloc.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(ShowAddressInitial()) {
    on<StoreAddressEvent>(storeAddress);
    on<GetAddressEvent>(getAddress);
    on<DeleteAddressEvent>(deleteFromAddress);
  }
  AddAddressResponseModel? addAddressResponseModel;
  GetAddressResponseModel? getAddressResponseModel;
  Future<void> storeAddress(
      StoreAddressEvent event, Emitter<AddAddressState> emit) async {
    emit(StoreAddressLoading());
    await AddAddressRepo.storeAddressRepo(event.params).then((value) {
      if (value != null) {
        addAddressResponseModel = value;
        emit(StoreAddressSuccess());
      } else {
        emit(StoreAddressError());
      }
    });
  }

  Future<void> getAddress(
      GetAddressEvent event, Emitter<AddAddressState> emit) async {
    emit(GetAddressLoading());
    await AddAddressRepo.getAddressDataRepo().then((value) {
      if (value != null) {
        getAddressResponseModel = value;
        emit(GetAddressSuccess(
            // getAddressResponseModel: value,

            ));
      } else {
        emit(GetAddressError());
      }
    });
  }

  Future<void> deleteFromAddress(
      DeleteAddressEvent event, Emitter<AddAddressState> emit) async {
    emit(DeleteAddressLoadingState());
    //api
    await AddAddressRepo.deleteCartRepo(event.id).then(
      (value) {
        if (value == true) {
          emit(DeleteAddressSuccessState());
        } else {
          emit(DeleteAddressErrorState());
        }
      },
    );
  }
}
