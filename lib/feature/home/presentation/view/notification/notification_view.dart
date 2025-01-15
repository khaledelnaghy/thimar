import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              Center(
                child: Text(
                  "الإشعارات",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
              ),
              Gap(40),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetData.note,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تم قبول طلبك وجاري تحضيرة الأن",
                        style: Styles.textStyle12.copyWith(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(5),
                      Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة\nلقد تم توليد هذا النص من مولد النص العربى",
                        style: Styles.textStyle10.copyWith(fontSize: 11),
                      ),
                      Text("منذ ساعتين"),
                    ],
                  ),
                ],
              ),
              Gap(10),
               Row(
                children: [
                  SvgPicture.asset(
                    AssetData.splashLogo,
                    height: 30,
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تم قبول طلبك وجاري تحضيرة الأن",
                        style: Styles.textStyle12.copyWith(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(5),
                      Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة\nلقد تم توليد هذا النص من مولد النص العربى",
                        style: Styles.textStyle10.copyWith(fontSize: 11),
                      ),
                      Text("منذ ساعتين"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
