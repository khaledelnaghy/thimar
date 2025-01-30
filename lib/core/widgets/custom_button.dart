import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {super.key,
      required this.text,
      required this.onPressed,
      this.radius = 60,
      this.height = 60,
      this.width = double.infinity,
      this.color = buttonColor,
      this.colorText = Colors.white});
  final Color? color;
  final Color? colorText;
  final String text;
  final Function() onPressed;
  final double radius;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: buttonColor),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle15.copyWith(color: colorText),
        ),
      ),
    );
  }
}
