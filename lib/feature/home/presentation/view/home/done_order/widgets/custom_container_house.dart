import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomContainerHouse extends StatelessWidget {
  const CustomContainerHouse(
      {super.key, this.icon, this.title, this.onPressed});

  final String? title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(  right: 10, left: 10),
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: accionColr),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.center,
            title ?? "",
            style: Styles.textStyle15
                .copyWith(fontWeight: FontWeight.w500, color: accionColr),
          ),
          Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
