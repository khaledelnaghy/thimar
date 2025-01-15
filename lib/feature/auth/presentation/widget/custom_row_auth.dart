import 'package:Thimar/core/constant/app_constant.dart';
 import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
 
class CustomRowAuth extends StatelessWidget {
  const CustomRowAuth(
      {super.key,
      required this.text,
      required this.textAction,
      this.onPressed});
  final String text;
  final String textAction;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textAction,
            style: Styles.textStyle18.copyWith(
              color: Color(0xff4C8613),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
