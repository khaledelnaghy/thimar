import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/shipping%20_now/shiping_now.dart';
import 'package:Thimar/feature/transaction_history/transaction_history.dart';
import 'package:Thimar/feature/wallet/widgets/custom_details_wallet.dart';
import 'package:Thimar/feature/wallet/widgets/custom_list_view_wallet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                style: Styles.textStyle20
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(20),
            Center(
              child: Text(
                "255 ر.س",
                style: Styles.textStyle20
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(20),
            CustomNDottedBorderButton(
              text: "اشحن الأن",
              onPressed: () {
                push(context, ShipingNow());
              },
            ),
            Gap(40),
            GestureDetector(
              onTap: () {
                push(context, TransactionHistory());
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
            Gap(10),
            if (index == 0)
              Expanded(
                child: CustomDetailsWallet(
                  date: DateFormat.yMd().format(DateTime.now()),
                  price: "255 ر.س",
                  text: "شحن المحفظة",
                ),
              ),
            if (index == 1)
              Expanded(
                child: CustomListViewWallet(),
              ),
          ],
        ),
      ),
    );
  }
}
