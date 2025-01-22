import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_row_text_form_field.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class PersonData extends StatelessWidget {
  const PersonData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50),
              CustomAppBarRow(
                iconButton: Icons.arrow_back_ios,
                text: 'البيانات الشخصية',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Gap(30),
              Center(
                child: Image.asset(
                  AssetData.person,
                  height: 110,
                  width: 100,
                ),
              ),
              Center(
                child: Text(
                  "محمد علي",
                  style: Styles.textStyle17.copyWith(
                      fontWeight: FontWeight.bold, color: buttonColor),
                ),
              ),
              Center(
                child: Text(
                  "123456789+",
                  style: Styles.textStyle17.copyWith(
                      fontWeight: FontWeight.w400, color: Color(0XFFA7A7A7)),
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffF3F3F3), width: 2),
                  // color: Colors.grey.shade100,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetData.personicon,
                      width: 30,
                      height: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "اسم المستخدم",
                          style: Styles.textStyle15.copyWith(
                            color: Color(0xffACBF98),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "محمد علي",
                          style: Styles.textStyle17.copyWith(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(20),
              CustomRowTextFormField(
                hintText: "959+",
                prefixIcon: Image.asset(AssetData.almPhoto),
                hintTextTwo: "رقم الجوال",
                prefixIconTwo: Icon(
                  FontAwesomeIcons.phoneFlip,
                  color: buttonColor,
                ),
              ),
              Gap(20),
              CutomTextFormField(
                hintText: "المدينة",
                fontSize: 17,
                prefixIcon: Icon(
                  FontAwesomeIcons.flag,
                  color: buttonColor,
                  size: 17,
                ),
              ),
              Gap(20),
              CutomTextFormField(
                hintText: "كلمة المرور",
                fontSize: 17,
                prefixIcon: Icon(
                  FontAwesomeIcons.locationPinLock,
                  color: buttonColor,
                  size: 17,
                ),
              ),
              Gap(20),
              CustomButton(
                text: "تعديل البيانات",
                onPressed: () {},
                color: buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
