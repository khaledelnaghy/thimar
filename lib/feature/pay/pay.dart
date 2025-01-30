import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/pay/widgets/add_card_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Pay extends StatelessWidget {
  const Pay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Gap(60),
              CustomAppBarRow(
                text: "الدفع",
                iconButton: Icons.arrow_back_ios_new,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Gap(30),
              Image.asset(AssetData.visaCard),
              Gap(30),
              CustomNDottedBorderButton(
                text: "إضافة عنوان",
                color: buttonColor,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddCardBottomSheet();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
