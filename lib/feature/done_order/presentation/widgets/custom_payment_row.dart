import 'dart:developer';

import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/done_order/presentation/view/fatoorah_action.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/payment_bottom_sheet.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPaymentRow extends StatefulWidget {
  const CustomPaymentRow({super.key, this.text});

  final String? text;

  @override
  State<CustomPaymentRow> createState() => _CustomPaymentRowState();
}

class _CustomPaymentRowState extends State<CustomPaymentRow> {
  int cheekColorBorder = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text ?? "",
          style: Styles.textStyle17.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  cheekColorBorder = 0;
                });
              },
              child: PaymentCard(
                logo: AssetData.cach,
                textColor: cheekColorBorder == 0 ? Colors.white : buttonColor,
                color: cheekColorBorder == 0 ? buttonColor : Colors.white,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                text: 'كاش',
              ),
            ),
            InkWell(
              onTap: () {
                push(
                    context,
                    PaymentMyFatoorah(
                      amount: 100,
                      onSuccess: (transId) {
                        log(' -=--=-=-==--==- $transId');
                      },
                    ));
                // showModelBottomSheetPayment(context);
                setState(() {
                  cheekColorBorder = 1;
                });
              },
              child: PaymentCard(
                logo: AssetData.masterCard,
                textColor: cheekColorBorder == 1 ? Colors.white : buttonColor,
                color: cheekColorBorder == 1 ? buttonColor : Colors.white,
                text: 'mastercard',
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            // Visa
            InkWell(
              onTap: () {
                showModelBottomSheetPayment(context);
                setState(() {
                  cheekColorBorder = 2;
                });
              },
              child: PaymentCard(
                logo: AssetData.visa,
                textColor: cheekColorBorder == 2 ? Colors.white : buttonColor,
                color: cheekColorBorder == 2 ? buttonColor : Colors.white,
                text: 'visa',
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
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
