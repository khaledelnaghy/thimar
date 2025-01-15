import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/view/home/basket/widgets/custom_list_view_basket_item.dart';
import 'package:Thimar/feature/home/presentation/view/home/basket/widgets/custom_total_price.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(40),
                CustomAppBarRow(
                  iconButton: Icons.arrow_back_ios,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "السلة",
                ),
                Gap(5),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (ctx, index) {
                        return CustomListViewBasketItem(
                          iconDelete: AssetData.delete,
                          iconAdd: Icons.add,
                          iconMinus: Icons.remove,
                          textName: "طماطم",
                          textPrice: "ر.س 450",
                          onTapAdd: () {},
                          onTapMinus: () {},
                          onTapDelete: () {},
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عندك كوبون؟ أدخل رقم الكوبون",
                      style: Styles.textStyle15.copyWith(
                        color: Color(0xffB9C9A8),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    CustomButton(
                      text: "تطبيق",
                      onPressed: () {},
                      weight: 80,
                      height: 40,
                      color: buttonColor,
                    ),
                  ],
                ),
                Gap(10),
                Text(
                  "جميع الأسعار تشمل قيمه الضريبة المضافة 15%",
                  style:
                      Styles.textStyle15.copyWith(fontWeight: FontWeight.w500),
                ),
                Gap(10),
                CustomTotalPrice(
                  textDisCount: "خصم",
                  textDisCountNumber: "-40 ر.س",
                  textTotoalPrice: "إجمالي المنتجات",
                  textTotoalPriceNumber: "1800 ر.س",
                  textTotal: "المجموع ",
                  textTotalNumber: "1800 ر.س",
                ),
                Gap(10),
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.doneOrder);
                  },
                  height: 50,
                  color: buttonColor,
                  text: "الانتقال لإتمام الطلب",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
