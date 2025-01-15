import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldShipping extends StatelessWidget {
  const CustomTextFormFieldShipping({super.key, this.hintText, this.maxLine});
  final String? hintText;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
        ),
        hintText: hintText,
        hintStyle: Styles.textStyle15.copyWith(
          fontWeight: FontWeight.bold,
          color: Color(0xffAFAFAF),
        ),
      ),
    );
  }
}
