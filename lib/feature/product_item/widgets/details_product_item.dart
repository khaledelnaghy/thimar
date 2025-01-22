import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsProductItem extends StatelessWidget {
  const DetailsProductItem(
      {super.key,
      this.priceProductAndSize,
      this.priceProduct,
      this.sizeProduct,
      this.add,
      this.remove,
      this.priceUnderLine,
      this.textProduct});

  final String? textProduct;
  final String? priceProductAndSize;
  final String? priceProduct;
  final String? sizeProduct;

  final IconData? add;
  final IconData? remove;

  final String? priceUnderLine;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textProduct ?? "",
              style: Styles.textStyle20.copyWith(
                fontSize: 22,
                color: buttonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              priceProductAndSize ?? "",
              // "السعر /1جكم",
              style: Styles.textStyle20.copyWith(
                fontSize: 19,
                color: Color(0xff808080),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Row(
              children: [
                Text(
                  sizeProduct ?? "",
                  // "40%",
                  style: Styles.textStyle13.copyWith(
                    color: Color(0xffFF0000),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  priceProduct ?? "",
                  // "45 ر.س",
                  style: Styles.textStyle17.copyWith(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  priceUnderLine ?? "",
                  // "56 ر.س",
                  style: Styles.textStyle14.copyWith(
                    color: accionColr,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      add,
                      color: buttonColor,
                    ),
                  ),
                  Text(
                    "5",
                    style: Styles.textStyle15.copyWith(
                        fontWeight: FontWeight.w500,
                        color: buttonColor,
                        fontSize: 17),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      remove,
                      color: buttonColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
