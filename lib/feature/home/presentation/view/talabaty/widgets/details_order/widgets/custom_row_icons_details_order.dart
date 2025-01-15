import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRowIconsDetailsOrder extends StatelessWidget {
  const CustomRowIconsDetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(AssetData.tomato, height: 30, width: 30),
                  Image.asset(AssetData.gzar, height: 30, width: 30),
                  Image.asset(AssetData.bate5, height: 30, width: 30),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, right: 6),
                    width: 30,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Text(
                      "2+",
                      style: Styles.textStyle11
                          .copyWith(fontSize: 15, color: buttonColor),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(right: 3),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: buttonColor,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              );
  }
}