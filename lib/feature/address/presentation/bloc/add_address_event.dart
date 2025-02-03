import 'package:Thimar/feature/address/data/model/request/add_address_params.dart';

class AddAddressEvent {}

// class AddToAddress extends AddAddressEvent {
//   final AddAddressParams params;
//   AddToAddress({required this.params});

class StoreAddressEvent extends AddAddressEvent {
  final AddAddressParams params;

  StoreAddressEvent({required this.params});
}

class GetAddressEvent extends AddAddressEvent {}

class DeleteAddressEvent extends AddAddressEvent {
  final int id;
  DeleteAddressEvent({required this.id});
}
