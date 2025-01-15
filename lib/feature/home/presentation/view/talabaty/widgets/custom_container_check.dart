import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomContainerCheck extends StatelessWidget {
  const CustomContainerCheck({super.key , this.textCurrent , this.textExpired});

  final String? textCurrent;
  final String? textExpired;

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF3F3F3), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Row(
                      children: [
                        CustomButton(
                            text: textCurrent??"",
                            weight: 140,
                            height: 50,
                            color: buttonColor,
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.talabatyView);
                            }),
                        CustomButton(
                            text: textExpired ??"",
                            weight: 140,
                            height: 50,
                            color: Colors.white,
                            textColor: Color(0xffA2A1A4),
                            onPressed: () {}),
                      ],
                    ),
                  ]),
                );
  }
}