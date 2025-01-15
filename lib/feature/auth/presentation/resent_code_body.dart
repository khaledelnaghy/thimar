import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/change_phone_number.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ResentCodeBody extends StatelessWidget {
  const ResentCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(30),
                  CustomLogo(
                    svgPicture: AssetData.splashLogo,
                    height: 160,
                    width: 60,
                  ),
                  CustomText(
                    textOne: "نسيت كلمة المرور",
                    textTwo:
                        "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                    fontSize: 15,
                  ),

                  ChangePhoneNumber(
                    textNumber: "+999999999",
                    textChangeNumber: "تغير رقم الجوال",
                    onPressed: () {},
                  ),
                  const Gap(10),
                  CustomPinCodeTextField(),
                  Gap(10),
                  CustomButton(
                    text: "تأكيد الكود",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.newPassword);
                    },
                  ),
                  Gap(20),
                  Center(
                    child: Text("لم تستلم الكود؟",
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Color(0xff707070),
                        )),
                  ),
                  Center(
                    child: Text("يمكنك إعادة إرسال الكود بعد",
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Color(0xff707070),
                        )),
                  ),
                  Gap(20),
                  // CustomCircularCountDownTimer(),
                  // Text("لم تستلم الكود؟ \n يمكنك إعادة إرسال الكود بعد",
                  //     style: Styles.textStyle16.copyWith(
                  //       fontWeight: FontWeight.normal,

                  //       color: Color (0xff707070),

                  //     )),
                  Gap(40),
                  CustomRowAuth(
                    text: "لديك حساب بالفعل ؟",
                    textAction: "تسجيل الدخول",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.registerView);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
