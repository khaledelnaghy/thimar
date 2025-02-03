import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_event.dart';
import 'package:Thimar/feature/cart/presentation/widgets/custom_list_view_cart_item.dart';
import 'package:Thimar/feature/cart/presentation/widgets/custom_total_price.dart';
import 'package:Thimar/feature/done_order/presentation/view/done_order.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int index = 0;
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(ShowCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    var cartData = context.read<CartBloc>().showCartResponseModels;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(40),
              CustomAppBarRow(
                iconButton: Icons.arrow_back_ios,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "السلة",
              ),
              Gap(5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.52,
                child: CustomListViewCartItem(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "عندك كوبون؟ أدخل رقم الكوبون",
                    style: Styles.textStyle15.copyWith(
                      color: Color(0xffB9C9A8),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  CustomButton(
                    text: "تطبيق",
                    onPressed: () {},
                    weight: 80,
                    height: 40,
                    color: buttonColor,
                  ),
                ],
              ),
              Gap(10),
              Text(
                cartData?.vipMessage ?? "",
                style: Styles.textStyle15.copyWith(fontWeight: FontWeight.w500),
              ),
              Gap(10),
              CustomTotalPrice(
                textDisCount: "خصم",
                textDisCountNumber: '-${cartData?.totalDiscount.toString()}ر.س',
                textTotoalPrice: "إجمالي المنتجات",
                textTotoalPriceNumber:
                    "${cartData?.totalPriceBeforeDiscount} ر.س",
                textTotal: "المجموع ",
                textTotalNumber: '${cartData?.totalPriceWithVat}ر.س',
              ),
              Gap(10),
              CustomButton(
                onPressed: () {
                  push(context, DoneOrder());
                },
                height: 50,
                color: buttonColor,
                text: "الانتقال لإتمام الطلب",
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
