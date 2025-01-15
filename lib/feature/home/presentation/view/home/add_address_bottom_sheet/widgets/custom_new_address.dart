import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomNDottedBorderButton extends StatelessWidget {
  const CustomNDottedBorderButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.padding,
      this.margin,
      this.height,
      this.color,
      this.fontSize,
      this.borderRadius,
      this.weight});

  final String text;
  final void Function()? onPressed;
  final double? height;
  final double? weight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? fontSize;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      color: accionColr,
       dashPattern: [4, 4],
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: accionColr,
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}
