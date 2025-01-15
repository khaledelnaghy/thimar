import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.padding,
      this.margin,
      this.height,
      this.textColor,
      this.color,
      this.fontSize,
      this.border,
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
final BoxBorder? border;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
      width: weight ?? double.infinity,
      height: height ?? 60,
      decoration: BoxDecoration(
        border: border ,
        color:color ?? accionColr,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: textColor??Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}
