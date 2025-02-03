import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/navigation_view.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_event.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_state.dart';
import 'package:Thimar/feature/auth/presentation/view/register_view.dart';
import 'package:Thimar/feature/auth/presentation/widget/change_phone_number.dart';
import 'package:Thimar/feature/auth/presentation/widget/circular_count_down_timer.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_auth.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_text.dart';
import 'package:Thimar/feature/auth/presentation/widget/pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ResentCodeBody extends StatefulWidget {
  const ResentCodeBody({super.key, required this.numberPhone});
  final String numberPhone;

  @override
  State<ResentCodeBody> createState() => _ResentCodeBodyState();
}

class _ResentCodeBodyState extends State<ResentCodeBody> {
  var pinController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is VerifySuccessState) {
              print("Verification successful! Navigating to the next screen.");
              pushAndRemoveUntil(context, const NavigationbarView());
               scaffoldMessenger(context, "تم التحقق بنجاح");
              
            } else if (state is VerifyErrorState) {
              scaffoldMessenger(context, state.errorMesaage);
            }
          },
          builder: (context, state) {
            print("Current Bloc State: $state");
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
                        textOne: "تفعيل الحساب",
                        textTwo:
                            "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                        fontSize: 15,
                      ),
                      ChangePhoneNumber(
                        textNumber: '${widget.numberPhone}',
                        textChangeNumber: "تغير رقم الجوال",
                        onPressed: () {},
                      ),
                      const Gap(10),
                      CustomPinCodeTextField(
                        controller: pinController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'رجاء ادخال الكود';
                          }
                          return null;
                        },
                      ),
                      Gap(10),
                      CustomButton(
                        text: "تأكيد الكود",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (pinController.text.isEmpty) {
                              scaffoldMessenger(context, "رجاء ادخال الكود");
                              return;
                            }
                            print("Entered Code: ${pinController.text}");

                            context.read<AuthBloc>().add(
                                  VerifiyEvent(
                                    code: pinController.text,
                                    phone: widget.numberPhone,
                                    deviceToken: "test",
                                    type: "ios",
                                  ),
                                );
                          }
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
                      CustomCircularCountDownTimer(),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: buttonColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'إعادة الإرسال',
                              style: Styles.textStyle18
                                  .copyWith(color: buttonColor),
                            )),
                      ),
                      CustomRowAuth(
                        text: "لديك حساب بالفعل ؟",
                        textAction: "تسجيل الدخول",
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
      ),
    );
  }
}
