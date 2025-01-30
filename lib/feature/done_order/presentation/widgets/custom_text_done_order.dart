import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextDoneOrder extends StatelessWidget {
  const CustomTextDoneOrder({super.key, this.textName, this.textNumber});

  final String? textName;
  final String? textNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20),
        Text(
          textName ?? "",
          style: Styles.textStyle17.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          textNumber ?? "",
          style: Styles.textStyle17.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(20),
      ],
    );
  }
}
