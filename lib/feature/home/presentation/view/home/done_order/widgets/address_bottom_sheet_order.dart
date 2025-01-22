import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/add_check_buttom_sheet_order.dart';
import 'package:flutter/material.dart';

class AddAddressBottomSheetOrder extends StatelessWidget {
  const AddAddressBottomSheetOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const SingleChildScrollView(
        child: AddCheckButtomSheetOrder(),
      ),
    );
  }
}
