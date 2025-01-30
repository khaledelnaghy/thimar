import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class GridViewFav extends StatelessWidget {
  const GridViewFav({super.key});

  @override
  Widget build(BuildContext context) {
    var item = context.read<FavoriteBloc>().favoriteResponseModel?.data;
    return Expanded(
      child: GridView.builder(
        itemCount: item?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 215,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.values.first,
                    children: [
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item?[index].mainImage ?? "",
                            width: double.infinity,
                            height: 115,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 110,
                        right: 100,
                        child: Row(
                          children: [
                            Container(
                              height: 22,
                              width: 63,
                              decoration: const BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Text(
                                "${item?[index].discount}%",
                                textAlign: TextAlign.center,
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item?[index].title ?? "",
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'السعر / 1كجم',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "${item?[index].price?.toStringAsFixed(0) ?? ""} رس",
                            style: Styles.textStyle16.copyWith(
                              color: buttonColor,
                            ),
                          ),
                          Text(
                            '${item?[index].priceBeforeDiscount}رس',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: buttonColor,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            padding: const EdgeInsets.only(
                                top: 12, left: 16, right: 16),
                            duration: const Duration(milliseconds: 500),
                            dismissDirection: DismissDirection.endToStart,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            width: double.infinity,
                            behavior: SnackBarBehavior.floating,
                            content: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.check_box,
                                        color: buttonColor,
                                      ),
                                      Text(
                                        'تم إضافة المنتج بنجاح',
                                        style: Styles.textStyle16.copyWith(
                                            color: buttonColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Gap(10),
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          item?[index].mainImage ?? "",
                                          height: 65,
                                          width: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Gap(10),
                                      Column(
                                        children: [
                                          Text(
                                            'طماطم',
                                            style: Styles.textStyle16.copyWith(
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            'الكميه:4',
                                            style: Styles.textStyle16.copyWith(
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            '200 رس',
                                            style: Styles.textStyle16.copyWith(
                                              color: buttonColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gap(25),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: CustomButton1(
                                        text: 'التحويل إلى السلة',
                                        onPressed: () {},
                                        radius: 15,
                                      )),
                                      Gap(15),
                                      Expanded(
                                        child: CustomButton1(
                                          text: 'تصفح العروض',
                                          onPressed: () {},
                                          radius: 15,
                                          colorText: buttonColor,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      heroTag: null,
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
