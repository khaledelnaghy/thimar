import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          GoRouter.of(context).push(AppRouter.forgetPassword);
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
