class AddAddressState {}

class ShowAddressInitial extends AddAddressState {}
//storeAddress

class StoreAddressLoading extends AddAddressState {}

class StoreAddressSuccess extends AddAddressState {}

class StoreAddressError extends AddAddressState {}

//getAddress
class GetAddressLoading extends AddAddressState {}

class GetAddressSuccess extends AddAddressState {
//   final GetAddressResponseModel? getAddressResponseModel;
// GetAddressSuccess({required this.getAddressResponseModel});
}

class GetAddressError extends AddAddressState {}

//delete
class DeleteAddressLoadingState extends AddAddressState {}

class DeleteAddressSuccessState extends AddAddressState {}

class DeleteAddressErrorState extends AddAddressState {}
