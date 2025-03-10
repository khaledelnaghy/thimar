import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final Widget icon;
  final double? size;
  final Function() onPressed;
  final Color color;
  final double? height;
  final double? width;

  const CustomIcons(
      {super.key,
      required this.icon,
      this.size,
      required this.onPressed,
      this.color = const Color(0xffF5F5F5),
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 24,
      width: width ?? 24,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: IconButton(
        iconSize: size,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
