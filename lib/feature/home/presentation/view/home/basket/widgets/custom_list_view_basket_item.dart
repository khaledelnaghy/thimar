import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomListViewBasketItem extends StatelessWidget {
  const CustomListViewBasketItem({
    super.key,
    this.textName,
    this.textPrice,
    this.onTapAdd,
    this.onTapMinus,
    this.iconAdd,
    this.onTapDelete,
    this.iconMinus,
    required this.iconDelete,
  });

  final String? textName;
  final String? textPrice;
  final void Function()? onTapAdd;
  final void Function()? onTapMinus;
  final void Function()? onTapDelete;
  final IconData? iconAdd;
  final IconData? iconMinus;

  final String iconDelete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AssetData.tomato,
              height: 75,
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textName ?? "",
                  style: Styles.textStyle15,
                ),
                Text(
                  textPrice ?? "",
                  style: Styles.textStyle13.copyWith(color: buttonColor),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 4),
                  width: 95,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            iconAdd,
                            size: 15,
                            color: accionColr,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "5",
                        style: Styles.textStyle11.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            iconMinus,
                            size: 15,
                            color: accionColr,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: onTapDelete,
              child: SvgPicture.asset(
                iconDelete,
              ),
            ),
          ],
        ),
        Gap(10),
      ],
    );
  }
}
