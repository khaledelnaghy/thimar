import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormRowShipping extends StatelessWidget {
  const CustomTextFormRowShipping(
      {super.key,
      this.widthTextnumber,
      this.dataExpire,
      this.textNumber,
      this.widthDataExpire});

  final String? dataExpire;

  final String? textNumber;
  final double? widthDataExpire;
  final double? widthTextnumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widthDataExpire ?? 150,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
              ),
              hintText: dataExpire,
              hintStyle: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
                color: Color(0xffAFAFAF),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: widthTextnumber ?? 150,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEEEEE), width: 2),
              ),
              hintText: textNumber,
              hintStyle: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
                color: Color(0xffAFAFAF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
