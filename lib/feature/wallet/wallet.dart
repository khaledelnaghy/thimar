import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
 import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/home/presentation/view/home/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/wallet/widgets/custom_details_ma7faza.dart';
import 'package:flutter/material.dart';
 import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
                  text: "المحفظة",
                  iconButton: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Gap(40),
              Center(
                child: Text(
                  "رصيدك",
                  style: Styles.textStyle20.copyWith(
                      color: buttonColor, fontWeight: FontWeight.bold),
                ),
              ),
              Gap(20),
              Center(
                child: Text(
                  "255 ر.س",
                  style: Styles.textStyle20.copyWith(
                      color: buttonColor, fontWeight: FontWeight.bold),
                ),
              ),
              Gap(20),
              CustomNDottedBorderButton(
                text: "اشحن الأن",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.shipingNow);
                },
              ),
              Gap(40),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.transactionHistory);
                },
                child: Row(
                  children: [
                    Text(
                      "سجل المعاملات",
                      style: Styles.textStyle15,
                    ),
                    Spacer(),
                    Text(
                      "عرض الكل",
                      style: Styles.textStyle15.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30),
             CustomDetailsMa7faza(
              date: "27 يونيو 2021",
              price: "255 ر.س",
              text: "شحن المحفظة",
             ),
            ],
          ),
        ),
      ),
      
    );
  }
}
