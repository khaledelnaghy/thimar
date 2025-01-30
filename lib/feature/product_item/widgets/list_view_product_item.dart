import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ListViewProductItem extends StatelessWidget {
  const ListViewProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 170,
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/tomato.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 2),
                            decoration: const BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Text(
                              '   45%-    ',
                              style: Styles.textStyle15
                                  .copyWith(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "طماطم",
                  style: Styles.textStyle15.copyWith(fontSize: 13),
                ),
                Text(
                  'السعر / 1كجم',
                  style: Styles.textStyle15
                      .copyWith(fontSize: 12, color: Colors.black),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          '45',
                          style: Styles.textStyle15.copyWith(fontSize: 12),
                        ),
                        Text(
                          " ر.س",
                          style: Styles.textStyle15.copyWith(fontSize: 12),
                        ),
                        Text(
                          '45',
                          style: Styles.textStyle15.copyWith(fontSize: 12),
                        ),
                        Text(
                          " ر.س",
                          style: Styles.textStyle15.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    FloatingActionButton.small(
                      heroTag: null,
                      onPressed: () {},
                      backgroundColor: buttonColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
