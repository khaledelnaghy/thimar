import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTotalPrice extends StatelessWidget {
  const CustomTotalPrice(
      {super.key,
      this.textTotoalPrice,
      this.textDisCount,
      this.textTotal,
      this.textTotoalPriceNumber,
      this.textDisCountNumber,
      this.textTotalNumber});

  final String? textTotoalPrice;
  final String? textTotoalPriceNumber;

  final String? textDisCount;
  final String? textDisCountNumber;
  final String? textTotal;
  final String? textTotalNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textTotoalPrice ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
              Text(
                textTotoalPriceNumber ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
            ],
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDisCount ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
              Text(
                textDisCountNumber ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
            ],
          ),
          Divider(
            color: Color(0xffE2E2E2),
          ),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textTotal ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
              Text(
                textTotalNumber ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w500, color: accionColr),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
