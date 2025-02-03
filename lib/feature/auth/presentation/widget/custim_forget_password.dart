import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/view/forget_password.dart';
import 'package:flutter/material.dart';

class CustimForgetPassword extends StatelessWidget {
  const CustimForgetPassword({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          push(context, ForgetPassword());
        },
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: Color(0xff707070),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
