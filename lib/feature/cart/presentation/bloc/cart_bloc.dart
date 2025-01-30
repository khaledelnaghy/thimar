import 'dart:developer';

import 'package:Thimar/feature/cart/data/models/resposne/show_cart_response_model.dart';
import 'package:Thimar/feature/cart/data/repo/cart_repo.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_event.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_state.dart';
import 'package:bloc/bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    //
    on<ShowCartEvent>(showCart);
    on<StoreCartEvent>(storeProduct);
    on<DeleteCartEvent>(deleteFromCart);
    on<UpdateCartEvent>(updateCart);
  }
  ShowCartResponseModel? showCartResponseModels;

  //show cart
  Future<void> showCart(ShowCartEvent event, Emitter<CartState> emit) async {
    emit(ShowCartLoadingState());
    //api
    await CartRepo.showCartRepo().then(
      (value) {
        if (value != null) {
          showCartResponseModels = value;
          log('======store');
          emit(ShowCartSuccessState());
        } else {
          emit(ShowCartErrorState());
        }
      },
    );
  }

  //store product in cart
  Future<void> storeProduct(
      StoreCartEvent event, Emitter<CartState> emit) async {
    emit(StoreProductLoadingState());
    //api
    await CartRepo.storeProductRepo(event.id, event.amount).then(
      (value) {
        if (value != null) {
          emit(StoreProductSuccessState());
        } else {
          emit(StoreProductErrorState());
        }
      },
    );
  }

  //delete from cart
  Future<void> deleteFromCart(
      DeleteCartEvent event, Emitter<CartState> emit) async {
    emit(DeleteCartLoadingState());
    //api
    await CartRepo.deleteCartRepo(event.id).then(
      (value) {
        if (value == true) {
          emit(DeleteCartSuccessState());
        } else {
          emit(DeleteCartErrorState());
        }
      },
    );
  }

  //update cart product quantity

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<CartState> emit) async {
    emit(UpdateCartLoadingState());
    //api
    await CartRepo.updateCartRepo(amount: event.amount, id: event.id).then(
      (value) {
        if (value == true) {
          emit(UpdateCartSuccessState());
        } else {
          emit(UpdateCartErrorState());
        }
      },
    );
  }
}

// import 'dart:developer';
// import 'package:Thimar/feature/cart/data/models/show_cart_response_model/show_cart_response_model.dart';
// import 'package:Thimar/feature/cart/data/repo/cart_repo.dart';
// import 'package:Thimar/feature/cart/presentation/bloc/cart_event.dart';
// import 'package:Thimar/feature/cart/presentation/bloc/cart_state.dart';
// import 'package:bloc/bloc.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartInitial()) {
//     on<ShowCartEvent>(showCart);
//     on<StoreCartEvent>(storeCart);
//     on<DeleteCartEvent>(deleteCart);
//     on<UpdateCartEvent>(updateCart);
//   }
//   ShowCartResponseModel? showCartResponseModels;

//   Future<void> showCart(ShowCartEvent event, Emitter<CartState> emit) async {
//     emit(ShowCartLoadingState());
//     //api
//     await CartRepo.showCartRepo().then(
//       (value) {
//         if (value != null) {
//           showCartResponseModels = value;
//           log('======store');
//           emit(ShowCartSuccessState());
//         } else {
//           emit(ShowCartErrorState());
//         }
//       },
//     );
//   }
//   // store product

//   Future<void> storeCart(StoreCartEvent event, Emitter<CartState> emit) async {
//     emit(StoreProductLoadingState());
//     //api
//     await CartRepo.storeProductRepo(event.id, event.amount).then(
//       (value) {
//         if (value != null) {
//           emit(StoreProductSuccessState());
//         } else {
//           emit(StoreProductErrorState());
//         }
//       },
//     );
//   }

//   Future<void> deleteCart(
//       DeleteCartEvent event, Emitter<CartState> emit) async {
//     emit(DeleteCartLoadingState());
//     //api
//     await CartRepo.deleteCartRepo(event.id).then(
//       (value) {
//         if (value == true) {
//           emit(DeleteCartSuccessState());
//         } else {
//           emit(DeleteCartErrorState());
//         }
//       },
//     );
//   }

//   Future<void> updateCart(
//       UpdateCartEvent event, Emitter<CartState> emit) async {
//     emit(UpdateCartLoadingState());
//     //api
//     await CartRepo.updateCartRepo(amount: event.amount, id: event.id).then(
//       (value) {
//         if (value == true) {
//           emit(UpdateCartSuccessState());
//         } else {
//           emit(UpdateCartErrorState());
//         }
//       },
//     );
//   }
// }

// // event + Emitter<State>
