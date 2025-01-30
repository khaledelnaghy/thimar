import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_grid_view_item.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListViewItemClick extends StatelessWidget {
  const ListViewItemClick({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(
            60,
          ),
          CustomAppBarRow(
            iconButton: Icons.arrow_back_ios_new,
            onPressed: () {
              Navigator.pop(context);
            },
            text: "خضراوات",
          ),
          Gap(
            20,
          ),
          Expanded(
            child: CustomGridViewItem(
              itemCount: 6,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
