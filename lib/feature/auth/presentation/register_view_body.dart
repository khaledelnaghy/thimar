import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
 import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
                    height: 130,
                  ),
                  CustomText(
                    textOne: "مرحبا بك مره أخري",
                    textTwo: "يمكنك تسجيل حساب جديد الأن",
                  ),
                 
                  CutomTextFormField(
                    hintText: "اسم المستخدم",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xffB1B1B1),
                      size: 20,
                    ),
                  ),
                  const Gap(5),
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
                  Gap(5),
                  CutomTextFormField(
                    hintText: "المدينة",
                    prefixIcon: Icon(
                      FontAwesomeIcons.flag,
                      color: Color(0XFF828282),
                      size: 17,
                    ),
                  ),
                  const Gap(5),
                    CutomTextFormField(
                    hintText: "كلمه المرور",
                    prefixIcon: Icon(
                      FontAwesomeIcons.locationPinLock,
                      color: Color(0XFF828282),
                      size: 17,
                    ),
                  ),
                  const Gap(5),
                    CutomTextFormField(
                    hintText: "تأكيد كلمه المرور",
                    prefixIcon: Icon(
                      FontAwesomeIcons.unlock,
                      color: Color(0XFF828282),
                      size: 17,
                    ),
                  ),
                  Gap(5),
                  CustomButton(
                    text: "تسجيل",
                    onPressed: () {},
                  ),
                  Gap(10),
                    CustomRowAuth(
                    text: "ليس لديك بالفعل؟",
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

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
