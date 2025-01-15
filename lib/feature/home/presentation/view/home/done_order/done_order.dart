import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/view/home/add_address_bottom_sheet/widgets/add_address_bottom_sheet.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/address_bottom_sheet_order.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_container_house.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_payment_row.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_row_address_done_order.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_row_data.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_text_done_order.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_text_form_field.dart';
import 'package:Thimar/feature/home/presentation/view/home/done_order/widgets/custom_total_price.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                CustomAppBarRow(
                  iconButton: Icons.arrow_back_ios,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "إتمام الطلب ",
                ),
                CustomTextDoneOrder(
                  textName: "الإسم : محمد",
                  textNumber: "الجوال :05068285914",
                ),
                CustomRowAddress(
                  icon: Icons.add,
                  onPressed: () {},
                  textAddressDriver: "أختر عنوان التوصيل",
                ),
                Gap(15),
                GestureDetector(
                  onTap: () {
                    showModelBottomSheetAddress(context);
                  },
                  child: CustomContainerHouse(
                    title: "المنزل:119 طريق الملك عبدالعزيز",
                    icon: Icons.arrow_drop_down,
                    onPressed: () {},
                  ),
                ),
                Gap(20),
                Text(
                  "تحديد وقت التوصيل",
                  style: Styles.textStyle17.copyWith(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                CustomRowData(
                  iconDay: Icons.schedule,
                  iconTime: Icons.timelapse,
                  onPressedDay: () {},
                  onPressedTime: () {},
                  textDay: "أختر اليوم والتاريخ",
                  textTime: "أختيار الوقت",
                ),
                Gap(20),
                Text(
                  "ملاحظات وتعليمات",
                  style: Styles.textStyle17.copyWith(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextFormFieldComments(),
                Gap(10),
                CustomPaymentRow(
                  text: "أختر طريقه الدفع",
                ),
                Gap(10),
                Text(
                  "ملخص الطلب",
                  style: Styles.textStyle17.copyWith(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTotalPriceOrder(
                  priceDriver: "سعر التوصيل",
                  priceDriverNumber: "40 ر.س",
                  textTotal: "المجموع",
                  textDisCount: "الخصم",
                  textDisCountNumber: "-40ر.س",
                  textTotalNumber: "180ر.س",
                  textTotoalPrice: "إجمالي المنتج",
                  textTotoalPriceNumber: "40 ر.س",
                ),
                CustomButton(
                  onPressed: () {
                    showModelBottomSheetDoneOrder(context);
                  },
                  text: "إنهاء الطلب",
                  color: buttonColor,
                ),
                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showModelBottomSheetDoneOrder(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return const AddAddressBottomSheetOrder();
        });
  }

  void showModelBottomSheetAddress(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return const AddAddressBottomSheet();
        });
  }
}
