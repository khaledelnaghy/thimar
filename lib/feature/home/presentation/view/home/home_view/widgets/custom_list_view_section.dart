import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewSection extends StatelessWidget {
  const CustomListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: 6,
          // controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 238, 223, 221),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .push(AppRouter.listViewItemClick);
                          },
                          child: Image.asset(
                            AssetData.steak,
                          ),
                        )),
                    Text(
                      "اللحوم",
                      style: Styles.textStyle20.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(width: 25),
              ],
            );
          }),
    );
  }
}
