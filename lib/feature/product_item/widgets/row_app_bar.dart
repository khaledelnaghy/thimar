import 'package:Thimar/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class RowAppBar extends StatelessWidget {
  const RowAppBar(
      {super.key,
      this.iconButtonBack,
      this.text,
      this.onPressedBack,
      this.onPressedFavourite,
      this.iconButtonFavourite});
  final IconData? iconButtonBack;
  final IconData? iconButtonFavourite;
  final void Function()? onPressedBack;

  final void Function()? onPressedFavourite;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5),
          height: 32,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onPressedBack,
            icon: Icon(
              iconButtonBack,
              color: buttonColor,
              size: 20,
            ),
          ),
        ),
        Spacer(),
        Container(
          padding: const EdgeInsets.only(right: 3),
          height: 32,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: onPressedFavourite,
            icon: Icon(
              iconButtonFavourite,
              size: 20,
              color: buttonColor,
            ),
          ),
        ),
      ],
    );
  }
}
