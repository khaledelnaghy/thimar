import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/details_order/details_order_finished.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinishedListView extends StatelessWidget {
  const FinishedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            push(context, const OrderDetailFinishedView());
          },
          child: Container(
            padding: EdgeInsets.only(left: 9, right: 9, top: 9, bottom: 13),
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'طلب #4587',
                      style: Styles.textStyle16,
                    )),
                    SizedBox(
                      height: 23,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0xffEAFFD5)),
                        child: Text('منتهي'),
                      ),
                    )
                  ],
                ),
                Text(DateFormat.yMd().format(DateTime.now())),
                Row(
                  children: [
                    Image.network(
                      'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                      width: 25,
                      height: 25,
                    ),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                      width: 25,
                      height: 25,
                    ),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2014/04/03/10/26/banana-310449_1280.png',
                      width: 25,
                      height: 25,
                    ),
                    Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3F3)),
                        child: Center(
                            child: Text(
                          '+2',
                          style: Styles.textStyle16,
                        ))),
                    const Spacer(),
                    Text(
                      '180 رس',
                      style: Styles.textStyle16,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
