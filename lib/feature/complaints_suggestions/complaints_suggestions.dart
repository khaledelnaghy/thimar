import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/shipping%20_now/widgets/custom_text_form_field_shipping.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ComplaintsSuggestions extends StatelessWidget {
  const ComplaintsSuggestions({super.key});

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
                text: "الشكاوي والإقتراحات",
                iconButton: Icons.arrow_back_ios_new,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Gap(40),
              CustomTextFormFieldShipping(
                hintText: "الإسم",
              ),
              Gap(10),
              CustomTextFormFieldShipping(
                hintText: "رقم الموبايل",
              ),
              Gap(10),
              CustomTextFormFieldShipping(
                hintText: "الموضوع",
                maxLine: 3,
              ),
              Gap(20),
              CustomButton(
                text: "إرسال",
                onPressed: () {},
                color: buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
