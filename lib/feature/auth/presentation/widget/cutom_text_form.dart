import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CutomTextFormField extends StatelessWidget {
  const CutomTextFormField(
      {super.key,
      this.height,
      this.hintText,
      this.prefixIcon,
      this.fontSize,
      this.color,
      this.validator,
      this.controller,
      this.padding,
      this.margin});
  final String? hintText;
  final Widget? prefixIcon;
  final Color? color;
  final double? fontSize;
  final double? height;
  final EdgeInsetsGeometry? padding;
final TextEditingController? controller;
final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Color(0xffF3F3F3), width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        controller: controller ,
        validator:validator ,
        decoration: InputDecoration(
          border: buildOutLineInputBorder(),
          enabledBorder: buildOutLineInputBorder(),
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: Styles.textStyle15.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            color: Color(0xffB1B1B1),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
