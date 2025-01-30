import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRowDayDetailsOrder extends StatelessWidget {
  const CustomRowDayDetailsOrder({super.key, this.textDay, this.price});

  final String? textDay;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textDay ?? "",
          style: Styles.textStyle14.copyWith(
            color: Color(0xff9C9C9C),
          ),
        ),
        Spacer(),
        Text(
          price ?? "",
          style: Styles.textStyle14.copyWith(
            color: accionColr,
          ),
        ),
      ],
    );
  }
}
