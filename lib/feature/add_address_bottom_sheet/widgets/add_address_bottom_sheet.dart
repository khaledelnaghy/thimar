import 'package:Thimar/feature/add_address_bottom_sheet/add_address_view.dart';
import 'package:flutter/material.dart';

class AddAddressBottomSheet extends StatelessWidget {
  const AddAddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: const SingleChildScrollView(
        child: AddAddressView(),
      ),
    );
  }
}
