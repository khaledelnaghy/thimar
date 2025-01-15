import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

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
                    textTwo: "ادخل رقم الجوال المرتبط بحسابك",
                  ),
                  Gap(15),
                  CustomRowTextFormField(
                    hintText: "966+",
                    prefixIcon: Image.asset(AssetData.almPhoto),
                    hintTextTwo: "رقم الجوال",
                    prefixIconTwo: const Icon(
                      FontAwesomeIcons.phoneFlip,
                      color: Color(0xff828282),
                      size: 17,
                    ),
                  ),
                  Gap(20),
                  CustomButton(
                    text: "تأكيد رقم الجوال",
                    onPressed: () {
                       GoRouter.of(context).push(AppRouter.resentCode);
                    },
                  ),
                  Gap(40),
                  CustomRowAuth(
                    text: "ليس لديك حساب بالفعل؟",
                    textAction: "تسجيل الدخول",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginView);
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
