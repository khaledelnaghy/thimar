import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_current_order.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_finished_order.dart';
import 'package:flutter/material.dart';

class CustomContainerCheck extends StatefulWidget {
  const CustomContainerCheck(
      {super.key,
      this.textCurrent,
      this.textExpired,
      this.onPressedFinsihed,
      this.onPressedCurrent,
      this.color,
      this.textColor});

  final String? textCurrent;
  final String? textExpired;
  final Color? color;
  final Color? textColor;
  final void Function()? onPressedFinsihed;
  final void Function()? onPressedCurrent;

  @override
  State<CustomContainerCheck> createState() => _CustomContainerCheckState();
}

class _CustomContainerCheckState extends State<CustomContainerCheck> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffF3F3F3), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Row(
          children: [
            Expanded(
              child: CustomButton1(
                radius: 10,
                color: index == 0 ? buttonColor : Colors.white,
                colorText: index == 0 ? Colors.white : buttonColor,
                text: 'الحاليه',
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: CustomButton1(
                radius: 10,
                color: index == 1 ? buttonColor : Colors.white,
                colorText: index == 1 ? Colors.white : buttonColor,
                text: 'المنتهيه',
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
            ),
            if (index == 0)
              const Expanded(
                child: CurrentListView(),
              ),
            if (index == 1)
              const Expanded(
                child: FinishedListView(),
              ),
          ],
        ),
      ]),
    );
  }
}
