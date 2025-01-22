import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddCheckButtomSheetOrder extends StatefulWidget {
  const AddCheckButtomSheetOrder({super.key});

  @override
  State<AddCheckButtomSheetOrder> createState() =>
      _AddCheckButtomSheetOrderState();
}

class _AddCheckButtomSheetOrderState extends State<AddCheckButtomSheetOrder> {
  final GlobalKey<FormState> formKey = GlobalKey();

  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SvgPicture.asset(AssetData.success),
          Gap(20),
          Text(
            "شكرا لك لقد تم تنفيذ طلبك بنجاح",
            style: Styles.textStyle20
                .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "يمكنك متابعة حالة الطلب اوالرجوع للرئيسية",
            style: Styles.textStyle17.copyWith(
                color: Color(0xffACACAC), fontWeight: FontWeight.w500),
          ),
          Gap(10),
          Row(
            children: [
              CustomButton(
                  text: "طلباتي",
                  weight: 140,
                  height: 60,
                  color: buttonColor,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.talabatyView);
                  }),
              CustomButton(
                  text: "الرئيسية",
                  weight: 145,
                  height: 60,
                  border: Border.all(color: accionColr),
                  color: Colors.white,
                  textColor: buttonColor,
                  onPressed: () {}),
            ],
          ),
          Gap(10),
        ],
      ),
    );
  }
}
