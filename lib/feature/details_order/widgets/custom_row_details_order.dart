import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_current_order.dart';
import 'package:flutter/material.dart';

class CustomRowOrder extends StatelessWidget {
  const CustomRowOrder({super.key, this.textTaalb, this.textWaitDone});

  final String? textTaalb;
  final String? textWaitDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textTaalb ?? "",
          style: Styles.textStyle17
              .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          height: 30,
          width: 90,
          decoration: BoxDecoration(
            color: Color(0xffEDF5E6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () {
              push(context, CurrentListView());
            },
            child: Center(
              child: Text(
                textWaitDone ?? "",
                style: Styles.textStyle11
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
