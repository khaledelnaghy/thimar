import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
 
class CustomDetailsProfile extends StatelessWidget {
  const CustomDetailsProfile(
      {super.key, this.icon, this.text, this.onTap, this.width});

  final String? text;
  final Function()? onTap;
  final String? icon;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon ?? AssetData.profile,
            width: width ?? 20,
             color: buttonColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text ?? "",
            style: Styles.textStyle16.copyWith(color: buttonColor),
          ),
          Spacer(),
          Image.asset(
            AssetData.lineArrow,
            width: 25,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
