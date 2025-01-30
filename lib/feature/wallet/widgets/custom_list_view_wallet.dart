import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CustomListViewWallet extends StatelessWidget {
  const CustomListViewWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // reverse: false,

      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          // height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17), color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/red_arrow.svg',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                  Gap(5),
                  Text(
                    'دفعت مقابل هذا الطلب',
                    style: Styles.textStyle16.copyWith(color: buttonColor),
                  ),
                  const Spacer(),
                  Text(DateFormat.yMd().format(DateTime.now()))
                ],
              ),
              ListTile(
                title: Text(
                  'طلب #4587',
                  style: Styles.textStyle13.copyWith(
                      fontWeight: FontWeight.normal, color: buttonColor),
                ),
                subtitle: Row(
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
                        color: Color(0xffE9E9E9),
                      ),
                      child: Center(
                        child: Text(
                          '+2',
                          style:
                              Styles.textStyle16.copyWith(color: buttonColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '180 رس',
                      style: Styles.textStyle16.copyWith(color: buttonColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
