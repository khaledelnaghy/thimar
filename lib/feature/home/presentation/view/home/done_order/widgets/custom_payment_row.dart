import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
 import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/payment_bottom_sheet.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPaymentRow extends StatelessWidget {
  const CustomPaymentRow({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? "",
        
          style: Styles.textStyle17.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PaymentCard(
              logo: AssetData.cach,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              text: 'كاش',
            ),
            InkWell(
              onTap: (){
                showModelBottomSheetPayment(context);
              },
              child: PaymentCard(
                logo: AssetData.masterCard,
                text: 'mastercard',
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            // Visa
            InkWell(
               onTap: (){
                showModelBottomSheetPayment(context);
              },
              child: PaymentCard(
                logo: AssetData.visa,
                text: 'visa',
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            // Cash
          ],
        ),
      ],
    );
  }
  void showModelBottomSheetPayment(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return const PaymentBottomSheet();
        });
  }
}
