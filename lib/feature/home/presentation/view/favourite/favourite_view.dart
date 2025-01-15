import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Center(
              child: Text(
                "المفضله",
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                  color: buttonColor,
                ),
              ),
            ),
            Expanded(child: CustomGridViewItem()),
          ],
        ),
      ),
    );
  }
}
