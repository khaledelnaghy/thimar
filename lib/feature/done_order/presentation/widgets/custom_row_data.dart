import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRowData extends StatelessWidget {
  const CustomRowData(
      {super.key,
      this.textDay,
      this.textTime,
      this.iconDay,
      this.iconTime,
      this.onPressedDay,
      this.onPressedTime});

  final String? textDay;
  final String? textTime;
  final IconData? iconDay;
  final IconData? iconTime;
  final void Function()? onPressedDay;
  final void Function()? onPressedTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5, left: 5),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF3F3F3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                textDay ?? "",
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w400, color: accionColr),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: onPressedDay,
                icon: Icon(
                  iconDay,
                  size: 20,
                  color: buttonColor,
                ),

                //
              )
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF3F3F3)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                textTime ?? "",
                //
                style: Styles.textStyle15
                    .copyWith(fontWeight: FontWeight.w400, color: accionColr),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: onPressedTime,
                icon: Icon(
                  iconTime,
                  size: 20,
                  color: buttonColor,
                  //    Icons.timelapse,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
