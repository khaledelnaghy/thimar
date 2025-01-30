import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_current_order.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_finished_order.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TalabatyView extends StatefulWidget {
  const TalabatyView({super.key});

  @override
  State<TalabatyView> createState() => _TalabatyViewState();
}

class _TalabatyViewState extends State<TalabatyView> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Gap(20),
              Center(
                child: Text(
                  "طلباتي",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
              ),
              Gap(10),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF3F3F3), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton1(
                      text: 'الحاليه',
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      radius: 10,
                      color: index == 0 ? buttonColor : Colors.white,
                      colorText:
                          index == 0 ? Colors.white : const Color(0xffA2A1A4),
                    )),
                    Gap(4),
                    Expanded(
                        child: CustomButton1(
                            text: 'المنتهية',
                            onPressed: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            radius: 10,
                            color: index == 1 ? buttonColor : Colors.white,
                            colorText:
                                index == 1 ? Colors.white : buttonColor)),
                  ],
                ),
              ),
              Gap(10),
              if (index == 0)
                const Expanded(
                  child: CurrentListView(),
                ),
              if (index == 1)
                const Expanded(
                  child: FinishedListView(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
