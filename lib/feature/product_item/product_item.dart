import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/product_item/widgets/details_product_item.dart';
import 'package:Thimar/feature/product_item/widgets/row_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              RowAppBar(
                iconButtonBack: Icons.arrow_back_ios_new,
                onPressedBack: () {
                  Navigator.pop(context);
                },
                iconButtonFavourite: Icons.favorite_border,
                onPressedFavourite: () {},
              ),
              Center(
                child: Image.asset(
                  AssetData.tomatoo,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(10),
              DetailsProductItem(
                priceProduct: "50 ر.س",
                priceProductAndSize: "السعر / 1كجم",
                priceUnderLine: "65 ر.س",
                sizeProduct: "40%",
                textProduct: "طماطم",
                add: Icons.add,
                remove: Icons.remove,
              ),
              Gap(20),
              Row(
                children: [
                  Text(
                    "كود المنتج",
                    style: Styles.textStyle17.copyWith(
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "1515",
                    style: Styles.textStyle18.copyWith(
                        fontSize: 19,
                        color: Color(0XFF808080),
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Gap(15),
              Text(
                "تفاصيل المنتج",
                style: Styles.textStyle17.copyWith(
                  color: buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14.copyWith(
                     color: Color(0XFF808080),
                    fontWeight: FontWeight.w300),
              ),
                            Gap(10),

            Row(
              children: [
                  Text(
                "التقيمات",
                style: Styles.textStyle17.copyWith(
                  color: buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "عرض الكل",
                style: Styles.textStyle15.copyWith(
                  color: buttonColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
