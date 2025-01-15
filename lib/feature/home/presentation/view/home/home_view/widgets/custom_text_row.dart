import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({super.key, this.textCategories, this.textSections});

  final String? textSections;
  final String? textCategories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            textSections ?? "",
            style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w800, color: Color(0xff000000)),
          ),
          Spacer(),
          Text(
            textCategories ?? "",
            style: Styles.textStyle14,
          ),
        ],
      ),
    );
  }
}
