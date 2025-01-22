import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRowTextFormField extends StatelessWidget {
  const CustomRowTextFormField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.hintTextTwo,
      this.validator,

      this.controller,
      this.prefixIconTwo});

  final String? hintText;

  final Widget? prefixIcon;
  final String? hintTextTwo;
  final Widget? prefixIconTwo;
final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 110,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF3F3F3), width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
          
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: buildOutLineInputBorder(),
              enabledBorder: buildOutLineInputBorder(),
              hintText: hintText,
              prefixIcon: prefixIcon,
              hintStyle: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: Color(0xff4C8613),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffF3F3F3), width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
                controller: controller,
            validator: validator,
              decoration: InputDecoration(
                border: buildOutLineInputBorder(),
                enabledBorder: buildOutLineInputBorder(),
                hintText: hintTextTwo,
                prefixIcon: prefixIconTwo,
                hintStyle: Styles.textStyle15.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffB1B1B1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
