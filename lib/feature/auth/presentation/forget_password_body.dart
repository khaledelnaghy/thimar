import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_event.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_state.dart';
import 'package:Thimar/feature/auth/presentation/resent_code_body.dart';
import 'package:Thimar/feature/auth/presentation/view/login_view.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              pushAndRemoveUntil(
                context,
                ResentCodeBody(
                  numberPhone: phoneController.text,
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
                        controller: phoneController,
                        hintText: "966+",
                        prefixIcon: Image.asset(AssetData.almPhoto),
                        hintTextTwo: "رقم الجوال",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'رجاء ادخال رقم الهاتف';
                          } else if (value.length < 5) {
                            return 'الرقم غير صحيح';
                          }
                          return null;
                        },
                        prefixIconTwo: const Icon(
                          FontAwesomeIcons.phoneFlip,
                          color: Color(0xff828282),
                          size: 17,
                        ),
                      ),
                      Gap(20),
                      state is ForgetPasswordLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              text: "تأكيد رقم الجوال",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .add(ForgetPasswordEvent(
                                        phone: phoneController.text,
                                      ));
                                }
                              },
                            ),
                      Gap(40),
                      CustomRowAuth(
                        text: "ليس لديك حساب بالفعل؟",
                        textAction: "تسجيل الدخول",
                        onPressed: () {
                          pushReplacement(context, LoginView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
