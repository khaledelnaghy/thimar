import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({
    super.key,
    this.hight,
    this.width,
    this.color,
    required this.onPressed,
    this.radius,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon,
  });
  final Color? color;
  final double? hight;
  final double? width;
  final Function() onPressed;
  final double? radius;
  final String text1;
  final String text2;
  final String text3;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 60,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              text1,
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              text2,
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ),
            Text(
              text3,
              style: Styles.textStyle16.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
