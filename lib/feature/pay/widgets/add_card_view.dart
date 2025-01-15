import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/shipping%20_now/widgets/custom_text_form_field_shipping.dart';
import 'package:Thimar/feature/shipping%20_now/widgets/custom_text_form_row_shipping.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          Center(
            child: Text(
              "إضافة بطاقة",
              style: Styles.textStyle15
                  .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
            ),
          ),
          Gap(20),
          CustomTextFormFieldShipping(
            hintText: "اسم صاحب البطاقة",
          ),
          Gap(20),
          CustomTextFormFieldShipping(
            hintText: "رقم البطاقة",
          ),
          Gap(20),
          CustomTextFormRowShipping(
            dataExpire: "تاريخ الإنتهاء (شهر / سنة)",
            widthDataExpire: 190,
            textNumber: "الرقم السري(CVC)",
          ),
          Gap(20),
          CustomButton(
            text: "إضافة بطاقة",
            onPressed: () {
              Navigator.pop(context);
            },
            color: buttonColor,
          ),
          Gap(20),
        ],
      ),
    );
  }
}
