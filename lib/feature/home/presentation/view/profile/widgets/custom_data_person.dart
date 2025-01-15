import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomDataPerson extends StatelessWidget {
  const CustomDataPerson(
      {super.key, this.myAccount, this.myPhone, this.name, this.photo});

  final String? myAccount;

  final String? myPhone;
  final String? name;
  final String? photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(25),
        Text(
          myAccount ?? "حسابي",
          style: Styles.textStyle20.copyWith(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(15),
        Image.asset(
          photo ?? AssetData.profilePhoto,
          height: 80,
        ),
        Gap(10),
        Text(
          name ?? "اسم المستخدم",
          style: Styles.textStyle20.copyWith(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          myPhone ?? "رقم الجوال",
          style: Styles.textStyle14.copyWith(
              color: Color(0xffA2D273),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Gap(10),
      ],
    );
  }
}
