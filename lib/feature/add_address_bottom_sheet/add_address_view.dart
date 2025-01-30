import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/custom_address_text_form_field.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:flutter/material.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formKey,
        // autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text("العناوين", style: Styles.textStyle15),
            const SizedBox(
              height: 20,
            ),
            CustomAddressTextField(),
            const SizedBox(
              height: 16,
            ),
            CustomNDottedBorderButton(
              text: "إضافة عنوان جديد",
              color: buttonColor,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
