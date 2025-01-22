import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAddressTextField extends StatelessWidget {
  const CustomAddressTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: buttonColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Text(
                    "المنزل",
                    style: Styles.textStyle15
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetData.delete,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AssetData.delete,
                  //      width: 23,
                  //   ),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetData.edit,
                    ),
                  ),
                  // IconButton(

                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AssetData.edit,
                  //     width: 23,
                  //   ),
                  // ),
                ],
              ),
              Text(
                "العنوان : 119 طريق الملك عبدالعزيز",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "الوصف",
                style: Styles.textStyle14.copyWith(
                    color: Color(0xff999797), fontWeight: FontWeight.w300),
              ),
              Text(
                "رقم الجوال",
                style: Styles.textStyle14.copyWith(
                    color: Color(0xff999797), fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Gap(15),
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: buttonColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Text(
                    "المنزل",
                    style: Styles.textStyle15
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetData.delete,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AssetData.delete,
                  //      width: 23,
                  //   ),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetData.edit,
                    ),
                  ),
                  // IconButton(

                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AssetData.edit,
                  //     width: 23,
                  //   ),
                  // ),
                ],
              ),
              Text(
                "العنوان : 119 طريق الملك عبدالعزيز",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "الوصف",
                style: Styles.textStyle14.copyWith(
                    color: Color(0xff999797), fontWeight: FontWeight.w300),
              ),
              Text(
                "رقم الجوال",
                style: Styles.textStyle14.copyWith(
                    color: Color(0xff999797), fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
