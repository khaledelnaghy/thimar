import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRowAddress extends StatelessWidget {
  const CustomRowAddress(
      {super.key, this.textAddressDriver, this.icon, this.onPressed});

  final String? textAddressDriver;
  final IconData? icon;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAddressDriver ?? "",
          style: Styles.textStyle17.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: buttonColor,
          ),
        ),
      ],
    );
  }
}
