import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.iconButton,
    this.textDriver,
    this.textIcon,
    this.tag,
    this.onPressedDrawer,
    this.onPressedAdrees,
  });

  final String? textIcon;
  final String? textDriver;
  final Widget? iconButton;
  final Object? tag;
  final void Function()? onPressedDrawer;
  final void Function()? onPressedAdrees;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomLogo(
          svgPicture: AssetData.splashLogo,
          height: 40,
          width: 50,
        ),
        Text(
          textIcon ?? "سلة ثمار",
          style: Styles.textStyle16.copyWith(color: buttonColor),
        ),
        SizedBox(
          width: 20,
        ),
        TextButton(
          onPressed: onPressedAdrees,
          child: Text(
            textDriver ?? "",
            // "التوصيل إلي \n شارع فهد الملك - جدة",
            style: Styles.textStyle14.copyWith(color: buttonColor),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 35,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: IconButton(
            onPressed: onPressedDrawer,
            icon: iconButton ??
                Icon(
                  FontAwesomeIcons.bars,
                  color: buttonColor,
                  size: 20,
                ),
          ),
        ),
      ],
    );
  }
}
