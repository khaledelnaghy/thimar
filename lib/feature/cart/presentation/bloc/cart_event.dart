class CartEvent {}

//show cart Event
class ShowCartEvent extends CartEvent {}

//store Product Event
class StoreCartEvent extends CartEvent {
  final String id;
  final String amount;
  StoreCartEvent({required this.id, required this.amount});
}

// update Product Event
class UpdateCartEvent extends CartEvent {
  final int id;
  final String amount;
  UpdateCartEvent({required this.id, required this.amount});
}

// delete Product Event
class DeleteCartEvent extends CartEvent {
  final int id;
  DeleteCartEvent({required this.id});
}
