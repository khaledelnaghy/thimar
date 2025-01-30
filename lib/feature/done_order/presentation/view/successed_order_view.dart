import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/core/widgets/navigation_view.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SuccessOrderView extends StatelessWidget {
  const SuccessOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8E8E8E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              height: 436,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38))),
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/success.svg',
                  height: 223,
                ),
                Gap(23),
                Text(
                  'شكرا لك لقد تم تنفيذ طلبك بنجاح',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
                Gap(11),
                Text(
                  'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
                 style: Styles.textStyle15.copyWith(
                  color: Color(0xff707070),
                 ),
                ),
                Gap(29),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton1(
                      onPressed: () {
                        pushReplacement(
                            context,
                            const NavigationbarView(
                              index: 1,
                            ));
                      },
                      text: 'طلباتي',
                      radius: 15,
                    )),
                    Gap(16),
                    Expanded(
                        child: CustomButton1(
                      onPressed: () {
                        pushReplacement(context, const HomeView());
                      },
                      text: 'الرئيسية',
                      radius: 15,
                      color: Colors.white,
                      colorText: buttonColor,
                    ))
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
