import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/wallet/widgets/custom_details_ma7faza.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

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
                  text: "سجل المعاملات",
                  iconButton: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Gap(40),
                    CustomDetailsMa7faza(
              date: "27 يونيو 2021",
              price: "255 ر.س",
              text: "شحن المحفظة",
             ),
              ],
            ),
          )),
    );
  }
}
