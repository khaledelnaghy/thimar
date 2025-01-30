import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/core/widgets/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Calling extends StatelessWidget {
  const Calling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: buttonColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            size: 25,
          ),
        ),
        title: Text(
          'تواصل معنا',
          style: Styles.textStyle15.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(10),
              Stack(
                children: [
                  SizedBox(
                    height: 210,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SvgPicture.asset(
                        'assets/images/map.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: 5,
                    right: 5,
                    child: Container(
                      height: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: buttonColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'شارع الملك فهد , جدة , المملكة العربية السعودية',
                                style: Styles.textStyle12.copyWith(
                                    color: buttonColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone_in_talk_outlined,
                                color: buttonColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '+966 054 87452',
                                style: Styles.textStyle14
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                color: buttonColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'info@thimar.com',
                                style: Styles.textStyle14
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(10),
              Center(
                child: Text('أو يمكنك إرسال رسالة ', style: Styles.textStyle15),
              ),
              Gap(30),
              TextFormField(
                decoration: const InputDecoration(hintText: 'الإسم'),
              ),
              Gap(5),
              TextFormField(
                decoration: const InputDecoration(hintText: 'رقم الموبايل'),
              ),
              Gap(5),
              Container(
                height: 110,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: 4,
                        minLines: null,
                        decoration: const InputDecoration(
                          hintText: 'الموضوع',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              CustomButton1(
                text: 'إرسال',
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
