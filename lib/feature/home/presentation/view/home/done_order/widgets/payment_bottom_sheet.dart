 import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/payment_bottom_sheet_view.dart';
import 'package:flutter/material.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const SingleChildScrollView(
        child: PaymentBottomSheetView(),
      ),
    );
  }
}
