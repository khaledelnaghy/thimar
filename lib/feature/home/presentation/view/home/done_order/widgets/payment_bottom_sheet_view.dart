import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PaymentBottomSheetView extends StatefulWidget {
  const PaymentBottomSheetView({super.key});

  @override
  State<PaymentBottomSheetView> createState() => _PaymentBottomSheetViewState();
}

class _PaymentBottomSheetViewState extends State<PaymentBottomSheetView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formKey,
        // autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text("البطاقة المحفوظة", style: Styles.textStyle15),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 2,
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Image.asset(
                      AssetData.visaCard,
                      // height: 100,
                      // width: 100,
                    );
                  }),
            ),
            Gap(15),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(
                      Icons.add,
                      color: buttonColor,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "إضافه بطاقه دفع",
                  style: Styles.textStyle17.copyWith(
                      color: buttonColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Gap(15),
            CustomButton(
              text: "تأكيد الأختيار",
              onPressed: () {},
              color: buttonColor,
            ),
            Gap(15),
          ],
        ),
      ),
    );
  }
}
