import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/data/models/request/register_params.dart';
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
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  String numberPhone = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            pushAndRemoveUntil(
              context,
              ResentCodeBody(
                numberPhone: numberPhone,
              ),
            );
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("يوجد خطا ف الادخال"),
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
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال الاسم";
                        }
                        return null;
                      },
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
                      controller: phoneController,
                      validator: (value) {
                        setState(() {
                          numberPhone = value.toString();
                        });
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال رقم الموبايل";
                        }
                        return null;
                      },
                      prefixIcon: Image.asset(AssetData.almPhoto),
                      hintTextTwo: "رقم الجوال",
                      prefixIconTwo: const Icon(
                        FontAwesomeIcons.phoneFlip,
                        color: Color(0xff828282),
                        size: 17,
                      ),
                    ),
                    Gap(5),
                    InkWell(
                      onTap: () {},
                      child: CutomTextFormField(
                        hintText: "المدينة",
                        prefixIcon: Icon(
                          FontAwesomeIcons.flag,
                          color: Color(0XFF828282),
                          size: 17,
                        ),
                      ),
                    ),
                    const Gap(5),
                    CutomTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال كلمه المرور";
                        }
                        return null;
                      },
                      hintText: "كلمه المرور",
                      prefixIcon: Icon(
                        FontAwesomeIcons.locationPinLock,
                        color: Color(0XFF828282),
                        size: 17,
                      ),
                    ),
                    const Gap(5),
                    CutomTextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال تاكيد كلمه السر";
                        }
                        return null;
                      },
                      hintText: "تأكيد كلمه المرور",
                      prefixIcon: Icon(
                        FontAwesomeIcons.unlock,
                        color: Color(0XFF828282),
                        size: 17,
                      ),
                    ),
                    Gap(5),
                    state is RegisterLoadingState
                        ? Center( child: const CircularProgressIndicator())
                        : CustomButton(
                            text: "تسجيل",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        params: RegisterParams(
                                          name: nameController.text,
                                          phone:
                                              int.parse(phoneController.text),
                                          password: int.parse(
                                              passwordController.text),
                                          confirmPassword: int.parse(
                                              confirmPasswordController.text),
                                        ),
                                      ),
                                    );
                              }
                            },
                          ),
                    Gap(10),
                    CustomRowAuth(
                      text: "ليس لديك بالفعل؟",
                      textAction: "تسجيل الدخول",
                      onPressed: () {
                        pushReplacement(context, const LoginView());
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

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
