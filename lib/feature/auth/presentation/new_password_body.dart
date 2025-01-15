import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
 import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
 import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

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
                  Gap(10),
                  CustomLogo(
                    svgPicture: AssetData.splashLogo,
                    height: 160,
                    width: 60,
                  ),
                  CustomText(
                    textOne: "نسيت كلمه المرور",
                    textTwo: "أدخل كلمة المرور الجديدة",
                  ),
                  CutomTextFormField(
                    hintText: " كلمه المرور القديمة",
                    prefixIcon: Icon(
                      FontAwesomeIcons.locationPinLock,
                      color: Color(0XFF828282),
                      size: 17,
                    ),
                  ),
                  Gap(20),
                  CutomTextFormField(
                    hintText: "كلمه المرور الجديدة",
                    prefixIcon: Icon(
                      FontAwesomeIcons.locationPinLock,
                      color: Color(0XFF828282),
                      size: 17,
                    ),
                  ),
                  Gap(30),
                  CustomButton(
                    text: "تغير كلمة المرور",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginView);
                    },
                  ),
                  Gap(60),
                  CustomRowAuth(
                    text: "ليس لديك حساب بالفعل ؟",
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
