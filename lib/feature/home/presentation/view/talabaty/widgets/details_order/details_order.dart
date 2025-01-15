import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/deails_order_talabaty.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/details_order/widgets/custom_all_data_details_order.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/details_order/widgets/custom_row_day_details_order.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/details_order/widgets/custom_row_details_order.dart';
import 'package:Thimar/feature/home/presentation/view/talabaty/widgets/details_order/widgets/custom_row_icons_details_order.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsOrderMaps extends StatelessWidget {
  const DetailsOrderMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              CustomAppBarRow(
                iconButton: Icons.arrow_back_ios,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "تفاصيل الطلب",
              ),
              Gap(15),
              CustomRowOrder(
                textTaalb: "طلب #59595",
                textWaitDone: "بإنتظار الموافقة",
              ),
              Gap(10),
              CustomRowDayDetailsOrder(
                price: "180 ر.س",
                textDay: "27يونيو , 2023",
              ),
              CustomRowIconsDetailsOrder(),
              Gap(20),
              Text(
                "عنوان التوصيل",
                style: Styles.textStyle17
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
              Gap(20),
              CustomAllDataDetailsOrder(
                house: "المنزل",
                address: "شقة40",
                flat: "شارع العليا الرياض 2521 السعوديه",
              ),
              Gap(15),
              Text(
                "ملخص الطلب",
                style: Styles.textStyle17
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
              Gap(15),
              DeailsOrderTalabaty(
                textTotal: "المجموع",
                textTotoalPrice: "إجمالي المنتج",
                textTotalNumber: "180ر.س",
                textTotoalPriceNumber: "180ر.س",
                textDisCount: "سعر التوصيل",
                textDisCountNumber: "40ر.س",
              ),
              Gap(40),
              CustomButton(
                text: "إلغاء الطلب",
                color: Color(0xffFFE1E1),
                textColor: Color(0xffFF0000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
