import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/core/widgets/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class OrderDetailFinishedView extends StatelessWidget {
  const OrderDetailFinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: buttonColor,
              ),
              size: 25,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'تفاصيل الطلب',
          style: Styles.textStyle16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(left: 9, right: 9, top: 9, bottom: 13),
                height: 109,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'طلب #4587',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        )),
                        SizedBox(
                          height: 23,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: const Color(0xffEAFFD6)),
                            child: Text('منتهي'),
                          ),
                        )
                      ],
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.yMd().format(DateTime.now()),
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                        Text(
                          '180 رس',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                          width: 25,
                          height: 25,
                        ),
                        Image.network(
                          'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                          width: 25,
                          height: 25,
                        ),
                        Image.network(
                          'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                          width: 25,
                          height: 25,
                        ),
                        Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffF3F3F3)),
                            child: Center(
                                child: Text(
                              '2+',
                              style: Styles.textStyle16,
                            ))),
                        const Spacer(),
                        CustomIcons(
                          icon: Icon(Icons.arrow_back_ios_new),
                          onPressed: () {},
                          size: 14,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'عنوان التوصيل',
                style: Styles.textStyle16.copyWith(color: buttonColor),
              ),
              Gap(16),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  title: Text(
                    'المنزل',
                    style: Styles.textStyle15,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'شقة 40',
                        style: Styles.textStyle15,
                      ),
                      Text(
                        'شارع العليا الرياض 12521السعودية',
                        style: Styles.textStyle15,
                      )
                    ],
                  ),
                  trailing: SvgPicture.asset(
                    'assets/images/map.svg',
                    width: 72,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(16),
              Text(
                'ملخص الطلب',
                style: Styles.textStyle20
                    .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
              ),
              Gap(16),
              Container(
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF3F8EE)),
                child: Column(
                  children: [
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'إجمالي المنتجات',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                        const Spacer(),
                        Text(
                          '180ر.س',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'سعر التوصيل',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                        const Spacer(),
                        Text(
                          '-40ر.س',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        )
                      ],
                    ),
                    const Divider(
                      indent: 40,
                      endIndent: 40,
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          'المجموع',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                        const Spacer(),
                        Text(
                          '140ر.س',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        )
                      ],
                    ),
                    const Divider(
                      indent: 40,
                      endIndent: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تم الدفع بواسطة',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/visa_icon.svg',
                          width: 50,
                          height: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(45),
              CustomButton1(
                text: 'تقييم المنتجات',
                onPressed: () {},
                radius: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
