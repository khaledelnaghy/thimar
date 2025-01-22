import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/shipping%20_now/widgets/custom_text_form_field_shipping.dart';
import 'package:Thimar/feature/shipping%20_now/widgets/custom_text_form_row_shipping.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShipingNow extends StatelessWidget {
  const ShipingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              CustomAppBarRow(
                  text: "شحن الأن",
                  iconButton: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Gap(40),
              Text(
                "معلومات المبلغ",
                style: Styles.textStyle15.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(20),
              CustomTextFormFieldShipping(
                hintText: "المبلغ الخاص بك",
              ),
              Gap(20),
              Text(
                "معلومات البطاقة",
                style: Styles.textStyle15.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(20),
              CustomTextFormFieldShipping(
                hintText: "الاسم",
              ),
              Gap(20),
              CustomTextFormFieldShipping(
                hintText: "رقم البطاقة الإنتمائية",
              ),
              Gap(20),
              CustomTextFormRowShipping(
                dataExpire: "تاريخ الانتهاء",
                textNumber: "الرقم المتسلسل",
              ),
              Spacer(),
              CustomButton(
                text: "دفغ",
                onPressed: () {},
                color: buttonColor,
              ),
              Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}
