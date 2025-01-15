import 'package:Thimar/core/constant/app_constant.dart';
 import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
 
class CustomContainerTalabaty extends StatelessWidget {
  const CustomContainerTalabaty(
      {super.key, this.textTalab, this.textDate, this.textStatus, this.price , this.onTap});

  final String? textTalab;
  final String? textDate;
  final String? textStatus;
  final String? price;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffF3F3F3), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(textTalab ?? "", style: Styles.textStyle15),
              Text(
                textDate ?? "",
                style: Styles.textStyle14.copyWith(
                  color: Color(0xff9C9C9C),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
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
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 4),
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: Color(0xffEDF5E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: onTap,

             
                  child: Center(
                    child: Text(
                      textStatus ?? "",
                      style: Styles.textStyle11.copyWith(
                          color: buttonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Gap(20),
              Text(
                price ?? "",
                style: Styles.textStyle15.copyWith(
                  color: accionColr,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
