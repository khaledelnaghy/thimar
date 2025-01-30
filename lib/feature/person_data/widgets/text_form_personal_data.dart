import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFormPersonalData extends StatelessWidget {
  const TextFormPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          suffixIcon: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffF3F3F3), width: 2),
                    borderRadius: BorderRadius.circular(15)),
                width: 35,
                height: 35,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: IconButton(
                    icon: const Icon(
                      color: buttonColor,
                      Icons.arrow_back_rounded,
                      size: 17,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: buttonColor,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: 'كلمة المرور',
          labelStyle: Styles.textStyle12.copyWith(fontSize: 13)),
    );
  }
}
