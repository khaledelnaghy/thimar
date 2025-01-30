import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          "إضافة عنوان",
          style: Styles.textStyle20.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(10),
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/images/map.svg',
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(30),
              Row(
                children: [
                  Text(
                    "نوع العمل",
                    style: Styles.textStyle15.copyWith(
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == 0 ? buttonColor : Colors.white,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: Text(
                          "المنزل",
                          style: Styles.textStyle15.copyWith(
                            color: index == 0 ? Colors.white : buttonColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == 1 ? buttonColor : Colors.white,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: Text(
                          "العمل",
                          style: Styles.textStyle15.copyWith(
                            color: index == 1 ? Colors.white : buttonColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Gap(20),
              TextFormField(
                decoration: const InputDecoration(hintText: 'أدخل رقم الهاتف'),
              ),
              Gap(20),
              TextFormField(
                decoration: const InputDecoration(hintText: 'الوصف'),
              ),
              Gap(80),
              CustomButton(
                text: "إضافة عنوان",
                onPressed: () {},
                color: buttonColor,
                weight: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
