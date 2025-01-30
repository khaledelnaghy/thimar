class CartState {}

class CartInitial extends CartState {}

//show Cart
class ShowCartLoadingState extends CartState {}

class ShowCartSuccessState extends CartState {}

class ShowCartErrorState extends CartState {}

//store product
class StoreProductLoadingState extends CartState {}

class StoreProductSuccessState extends CartState {}

class StoreProductErrorState extends CartState {}

//update product
class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {}

class UpdateCartErrorState extends CartState {}

//delete product
class DeleteCartLoadingState extends CartState {}

class DeleteCartSuccessState extends CartState {}

class DeleteCartErrorState extends CartState {}
