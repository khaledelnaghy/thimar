import 'package:Thimar/feature/pay/widgets/add_card_view.dart';
import 'package:flutter/material.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 5, right: 5, bottom: MediaQuery.of(context).viewInsets.left),
      child: const SingleChildScrollView(
        child: AddCardView(),
      ),
    );
  }
}
