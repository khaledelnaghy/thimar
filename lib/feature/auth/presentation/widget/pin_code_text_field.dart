import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        inactiveFillColor: Colors.white,
        activeColor: Color(0xff4C8613),
        inactiveColor: Color(0xffF3F3F3),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      // controller: pinCodeController,
      onCompleted: (v) {
        // print("Completed");
      },
      onChanged: (value) {
        // print(value);
        // setState(() {
        //   currentText = value;
        // });
      },

      validator: (value) {
        return null;

        // if (value == null || value.isEmpty) {
        //   return 'please enter your code';
        // } else {
        //   return null;
        // }
      },
    );
  }
}
