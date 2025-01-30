import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/done_order/presentation/view/successed_order_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SavedCardView extends StatelessWidget {
  const SavedCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8E8E8E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              child: Column(
                children: [
                  Gap(15),
                  Text(
                    'البطاقات المحفوظة',
                    style: Styles.textStyle16.copyWith(
                      color: buttonColor,
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    height: 108,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            AssetData.visaCard,
                            width: 240,
                            height: 107,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: buttonColor,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "إضافه بطاقه دفع",
                        style: Styles.textStyle17.copyWith(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Gap(30),
                  CustomButton(
                    text: "تأكيد الأختبار",
                    fontSize: 20,
                    onPressed: () {
                      pushAndRemoveUntil(context, const SuccessOrderView());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
