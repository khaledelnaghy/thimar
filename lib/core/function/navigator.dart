import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

//push
push(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

//pushReplacement
pushReplacement(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

//pushAndRemoveUntil
pushAndRemoveUntil(BuildContext context, Widget screen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

void scaffoldMessenger(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
        // side:   BorderSide(color: Colors.green.withAlpha(100)),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 200),
      content: Text(
        // "تم الإضافة بنجاح",
        text,
        style: Styles.textStyle15.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
