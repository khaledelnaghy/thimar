import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber(
      {super.key,
      required this.textNumber,
      required this.textChangeNumber,
      this.onPressed});

  final String textNumber;
  final String textChangeNumber;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textNumber,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w300,
            color: Color(0xff707070),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textChangeNumber,
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 15,
              textBaseline: TextBaseline.ideographic,
              color: Color(0xff4C8613),
            ),
          ),
        ),
      ],
    );
  }
}
