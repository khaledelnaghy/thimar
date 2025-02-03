import 'package:Thimar/feature/done_order/data/repo/done_order_repo.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_event.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_state.dart';
import 'package:bloc/bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<ConfirmOrderEvent>(confirmOrder);
  }
  //confirm order
  Future<void> confirmOrder(
      ConfirmOrderEvent event, Emitter<OrderState> emit) async {
    emit(ConfirmOrderLoadingState());
    //api
    await OrderRepo.confirmOrderRepo(
      addressId: event.addressId,
      date: event.date,
      payType: event.payType,
      time: event.time,
    ).then(
      (value) {
        if (value == true) {
          emit(ConfirmOrderSuccessState());
        } else {
          emit(ConfirmOrderErrorState());
        }
      },
    );
  }
}
