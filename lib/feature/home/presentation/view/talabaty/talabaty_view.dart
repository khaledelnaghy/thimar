import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';

import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/custom_container_check.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/custom_container_talabaty.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TalabatyView extends StatelessWidget {
  const TalabatyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Center(
                  child: Text(
                    "طلباتي",
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: buttonColor,
                    ),
                  ),
                ),
                Gap(10),
                CustomContainerCheck(
                  textCurrent: "الحاليه",
                  textExpired: "المنتهية",
                ),
                Gap(10),
                CustomContainerTalabaty(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.detailsOrder);
                  },
                  textTalab: "طلب #5454",
                  textDate: "27يونيو , 2023",
                  textStatus: "بإنتظار الموافقة",
                  price: "180 ر.س",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
