import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:Thimar/feature/product_item/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key, this.itemCount, this.physics});

  final int? itemCount;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSuccessState || current is HomeSuccessState,
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var products = context.read<HomeBloc>().homeResponseModel?.data;
          return GridView.builder(
              // shrinkWrap: true,
              itemCount: itemCount ?? 4,
              physics: physics ?? NeverScrollableScrollPhysics(),
              // physics: BouncingScrollPhysics(),

              controller: ScrollController(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.6,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.values.first,
                        children: [
                          GestureDetector(
                            onTap: () {
                              push(
                                context,
                                ProductItem(
                                  item: products![index],
                                ),
                              );
                            },
                            child: Hero(
                              tag: products?[index].id ?? "",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  products?[index].mainImage ?? "",
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 130,
                            right: 90,
                            child: Container(
                              padding: EdgeInsets.only(top: 1),
                              height: 22,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  //  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: buttonColor,
                              ),
                              child: Text(
                                "${products?[index].discount.toString() ?? ""} %-",
                                textAlign: TextAlign.center,
                                style: Styles.textStyle14.copyWith(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        products?[index].title ?? "",
                        style: Styles.textStyle15,
                      ),
                      Text(
                        "السعر/ 1كجم",
                        style: Styles.textStyle12
                            .copyWith(color: Color(0xff808080), fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${products?[index].price?.toStringAsFixed(0) ?? ""}ر.س",
                            style: Styles.textStyle15.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: buttonColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "${products![index].priceBeforeDiscount?.toStringAsFixed(0) ?? ""}ر.س",
                              style: Styles.textStyle13.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: accionColr,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: accionColr,
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                      Gap(15),
                      CustomButton(
                          height: 30,
                          weight: 110,
                          borderRadius: BorderRadius.circular(10),
                          text: "أضف للسلة",
                          fontSize: 12,
                          onPressed: () {}),
                    ],
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
