import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarRow extends StatelessWidget {
  const CustomAppBarRow(
      {super.key, this.iconButton, this.text, this.onPressed});

  final IconData? iconButton;

  final String? text;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 3),
          height: 32,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconButton,
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: 75,
        ),
        Text(
          text ?? "",
          style: Styles.textStyle20.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
