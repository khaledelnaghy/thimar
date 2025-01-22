import 'package:flutter/material.dart';

const buttonColor = Color(0xff4C8613);

const accionColr = Color(0xff61B80C);

const priceColor = Color(0xff808080);
const kTranstionDuration = Duration(milliseconds: 250);
const logo = 'تمارا';
const tajawal = 'Tajawal';

class PaddingHorizontal extends StatelessWidget {
  const PaddingHorizontal({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: child,
    );
  }
}
