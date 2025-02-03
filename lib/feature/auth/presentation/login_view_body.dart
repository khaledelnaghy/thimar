import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/navigation_view.dart';
import 'package:Thimar/feature/auth/data/models/request/login_params.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_event.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_state.dart';
import 'package:Thimar/feature/auth/presentation/view/forget_password.dart';
import 'package:Thimar/feature/auth/presentation/view/register_view.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custim_forget_password.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            pushAndRemoveUntil(context, const NavigationbarView());
          scaffoldMessenger(context, "تم تسجيل الدخول بنجاح", );
          
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  // side:   BorderSide(color: Colors.green.withAlpha(100)),
                  borderRadius: BorderRadius.circular(15),
                ),

                // padding: const EdgeInsets.all(15),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),

                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),

                content: Text(
                  "يوجد خطأ في الإدخال",
                  style: Styles.textStyle15.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      controller: phoneController,
                      prefixIcon: Image.asset(AssetData.almPhoto),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال رقم الموبايل";
                        }
                        return null;
                      },
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
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال كلمه السر";
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        FontAwesomeIcons.locationPinLock,
                        color: Color(0XFF828282),
                        size: 17,
                      ),
                    ),
                    CustimForgetPassword(
                      text: "نسيت كلمه المرور ؟",
                      onPressed: () {
                        pushAndRemoveUntil(context, const ForgetPassword());
                      },
                    ),
                    Gap(30),
                    state is LoginLoadingState
                        ? Center(
                            child: Center(
                                child: const CircularProgressIndicator()))
                        : CustomButton(
                            text: "تسجيل الدخول",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      LoginEvent(
                                        params: LoginParams(
                                          deviceToken: "test",
                                          type: "ios",
                                          userType: "client",
                                          phone:
                                              int.parse(phoneController.text),
                                          password: int.parse(
                                              passwordController.text),
                                        ),
                                      ),
                                    );
                              }
                            },
                          ),
                    Gap(60),
                    CustomRowAuth(
                      text: "ليس لديك حساب؟",
                      textAction: "تسجيل الأن",
                      onPressed: () {
                        pushReplacement(context, const RegisterView());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
//  GoRouter.of(context).push(AppRouter.navigationBarView);
