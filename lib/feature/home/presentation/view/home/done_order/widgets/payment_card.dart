import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCard extends StatelessWidget {
  final String logo;
  final Color? color;
  final String? text;
  final double? width;
  final Color? textColor;
  final ColorFilter? colorFilter;
  const PaymentCard({
    super.key,
    required this.logo,
    this.color,
    this.text,
    this.width,
    this.textColor,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 50,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[400]!, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            logo,
            colorFilter: colorFilter ??
                const ColorFilter.mode(buttonColor, BlendMode.srcIn),
            width: width ?? 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text ?? "",
            style: Styles.textStyle15.copyWith(color: accionColr),
          ),
        ],
      ),
    );
  }
}
