import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.textOne, required this.textTwo, this.fontSize});
  final String textOne;
  final String textTwo;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textOne,
          style: Styles.textStyle16.copyWith(color: Color(0xff4C8613)),
        ),
        const Gap(5),
        Text(
          textTwo,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w300,
            color: Color(0xff707070),
            fontSize: fontSize,
          ),
        ),
        
      ],
    );
  }
}
