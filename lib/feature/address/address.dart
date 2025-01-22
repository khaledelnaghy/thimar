import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/feature/home/presentation/view/home/add_address_bottom_sheet/widgets/custom_address_text_form_field.dart';
import 'package:Thimar/feature/home/presentation/view/home/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Address extends StatelessWidget {
  const Address({super.key});

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
                  text: "العناوين",
                  iconButton: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Gap(25),
                CustomAddressTextField(),
                const Gap(25),
                CustomNDottedBorderButton(
                  text: "إضافة عنوان",
                  color: buttonColor,
                ),
              ],
            ),
          )),
    );
  }
}
