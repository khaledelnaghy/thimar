import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Lottie.asset("assets/lottie/loading_animation.json");
      });
}
