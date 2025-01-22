import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, this.controller, this.validator});
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      cursorColor: Colors.white,

      appContext: context,
      validator: validator,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        errorBorderColor: Colors.black,
        inactiveFillColor: Colors.white,
        activeColor: Colors.white,
        selectedColor: Colors.grey,
        selectedFillColor: Colors.white,
        inactiveColor: Color(0xff4C8613),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 60,
        activeFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      // controller: pinCodeController,
      onCompleted: (v) {
        print("Completed");
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");

        return true;
      },
    );
  }
}
