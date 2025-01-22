import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAllDataDetailsOrder extends StatelessWidget {
  const CustomAllDataDetailsOrder(
      {super.key, this.address, this.flat, this.house});

  final String? house;
  final String? flat;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address ?? "",
              style: Styles.textStyle15.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(5),
            Text(
              flat ?? "",
              style: Styles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
                color: Color(0xff999797),
              ),
            ),
            Gap(5),
            Text(
              house ?? "",
              style: Styles.textStyle15.copyWith(
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset(AssetData.map),
      ],
    );
  }
}
