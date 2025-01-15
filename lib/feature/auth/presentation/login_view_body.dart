import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custim_forget_password.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50),
                CustomLogo(
                  svgPicture: AssetData.splashLogo,
                  height: 160,
                  width: 60,
                ),
                CustomText(
                  textOne: "مرحبا بك مره أخري",
                  textTwo: "يمكنك تسجيل الدخول الأن",
                ),
                CustomRowTextFormField(
                  hintText: "+966",
                  prefixIcon: Image.asset(AssetData.almPhoto),
                  hintTextTwo: "رقم الجوال",
                  prefixIconTwo: const Icon(
                    FontAwesomeIcons.phoneFlip,
                    color: Color(0xff828282),
                    size: 17,
                  ),
                ),
                Gap(20),
                CutomTextFormField(
                  hintText: "كلمه المرور",
                  prefixIcon: Icon(
                    FontAwesomeIcons.locationPinLock,
                    color: Color(0XFF828282),
                    size: 17,
                  ),
                ),
                CustimForgetPassword(
                  text: "نسيت كلمه المرور ؟",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgetPassword);
                  },
                ),
                Gap(30),
                CustomButton(
                  text: "تسجيل الدخول",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.navigationBarView );
                  },
                ),
                Gap(60),
                CustomRowAuth(
                  text: "ليس لديك حساب؟",
                  textAction: "تسجيل الأن",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.registerView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
