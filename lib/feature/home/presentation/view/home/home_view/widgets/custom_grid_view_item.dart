import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, this.itemCount, this.physics});

  final int? itemCount;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // shrinkWrap: true,
        itemCount: itemCount ?? 4,
        physics: physics ?? NeverScrollableScrollPhysics(),
        // physics: BouncingScrollPhysics(),

        controller: ScrollController(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.4,
          mainAxisSpacing: 40,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.values.first,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.productItem);
                      },
                      child: Image.asset(
                        AssetData.tomato,
                        height: 130,
                      ),
                    ),
                    Positioned(
                      bottom: 105,
                      right: 95,
                      left: 13,
                      child: Container(
                        padding: EdgeInsets.only(top: 1),
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            //  topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: buttonColor,
                        ),
                        child: Text(
                          "52%-",
                          textAlign: TextAlign.center,
                          style: Styles.textStyle14.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "طماطم",
                  style: Styles.textStyle15,
                ),
                Text(
                  "السعر/ 1كجم",
                  style: Styles.textStyle12.copyWith(color: Color(0xff808080)),
                ),
                Row(
                  children: [
                    Text(
                      "45 ر.س",
                      style: Styles.textStyle15.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4C8613)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "56 ر.س",
                      style: Styles.textStyle13.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: buttonColor,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: accionColr,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                  ],
                ),
                Gap(8),
                CustomButton(
                    height: 30,
                    weight: 110,
                    borderRadius: BorderRadius.circular(10),
                    text: "أضف للسلة",
                    fontSize: 12,
                    onPressed: () {}),
              ],
            ),
          );
        });
  }
}
