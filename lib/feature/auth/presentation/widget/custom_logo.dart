import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo(
      {super.key, required this.svgPicture, this.height, this.width});

  final String svgPicture;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        svgPicture,
        height: height,
        width: width,
      ),
    );
  }
}
// AssetData.splashLogo,
