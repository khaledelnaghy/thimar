import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomDetailsWallet extends StatelessWidget {
  const CustomDetailsWallet({super.key, this.text, this.price, this.date});

  final String? text;

  final String? price;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetData.arrowTop,
                    height: 20,
                    colorFilter: ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        text ?? "",
                        style: Styles.textStyle15,
                      ),
                      Text(
                        price ?? "",
                        //        "255 ر.س",
                        style: Styles.textStyle20.copyWith(
                            color: buttonColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    // "27 يونيو 2021",
                    date ?? "",
                    style: Styles.textStyle14.copyWith(
                      color: Color(0xff9C9C9C),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Gap(20),
            ],
          );
        });
  }
}
