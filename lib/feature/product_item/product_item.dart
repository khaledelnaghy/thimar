import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/cutom_bottom_icon.dart';
import 'package:Thimar/feature/cart/presentation/view/cart_view.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_event.dart';
import 'package:Thimar/feature/home/data/models/home_response_model/datum.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_event.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:Thimar/feature/product_item/widgets/details_product_item.dart';
import 'package:Thimar/feature/product_item/widgets/list_view_evalution_star.dart';
import 'package:Thimar/feature/product_item/widgets/list_view_product_item.dart';
import 'package:Thimar/feature/product_item/widgets/row_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.item});

  final ProductDetailsModel item;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ProductEvaluationHome());
  }

  double count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ProductEvaluationSuccessState) {
            scaffoldMessenger(
              context,
              "تم الإضافة بنجاح",
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                RowAppBar(
                  iconButtonBack: Icons.arrow_back_ios_new,
                  onPressedBack: () {
                    Navigator.pop(context);
                  },
                  iconButtonFavourite: Icons.favorite_border,
                  onPressedFavourite: () {
                    context.read<HomeBloc>().add(
                          AddToFavorite(id: widget.item.id ?? 0),
                        );
                    scaffoldMessenger(context, "تم الإضافة بنجاح");
                  },
                ),
                Hero(
                  flightShuttleBuilder: (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                  ) {
                    final Hero toHero = toHeroContext.widget as Hero;
                    return RotationTransition(
                      turns: animation,
                      child: toHero.child,
                    );
                  },
                  tag: widget.item.id ?? "",
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Center(
                      child: Image.network(
                        widget.item.mainImage ?? "",
                        fit: BoxFit.cover,
                        height: 255,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Gap(10),
                DetailsProductItem(
                  priceProduct: "${widget.item.price!.toStringAsFixed(0)} ر.س",
                  priceProductAndSize: "السعر / 1كجم",
                  priceUnderLine:
                      "${widget.item.priceBeforeDiscount!.toStringAsFixed(0)} ر.س",
                  sizeProduct: "${widget.item.discount.toString()} %",
                  textProduct: widget.item.title ?? "",
                  add: Icons.add,
                  remove: Icons.remove,
                  text: count.toStringAsFixed(0),
                  onPressedAdd: () {
                    setState(() {
                      count++;
                    });
                  },
                  onPressedRemove: () {
                    setState(() {
                      if (count > 1) {
                        count--;
                      }
                    });
                  },
                ),
                Gap(10),
                Row(
                  children: [
                    Text(
                      "كود المنتج",
                      style: Styles.textStyle17.copyWith(
                        color: buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item.id.toString(),
                      style: Styles.textStyle18.copyWith(
                          fontSize: 19,
                          color: Color(0XFF808080),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Gap(15),
                Text(
                  "تفاصيل المنتج",
                  style: Styles.textStyle17.copyWith(
                    color: buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                Text(
                  widget.item.description ?? "",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(
                      color: Color(0XFF808080), fontWeight: FontWeight.w300),
                ),
                Gap(10),
                Row(
                  children: [
                    Text(
                      "التقيمات",
                      style: Styles.textStyle17.copyWith(
                        color: buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "عرض الكل",
                      style: Styles.textStyle15.copyWith(
                        color: buttonColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ListViewEvalutionStar(),
                ),
                Gap(10),
                Text(
                  "منتجات متشابهة",
                  style: Styles.textStyle17.copyWith(
                      fontWeight: FontWeight.bold, color: buttonColor),
                ),
                ListViewProductItem(),
                Gap(10),
                CustomButtonIcon(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(StoreCartEvent(
                        id: widget.item.id.toString(),
                        amount: count.toString()));
                    pushReplacement(context, const CartView());
                  },
                  text1: "إضافة إلي السلة",
                  text2: "${widget.item.price!.toStringAsFixed(0)}  ",
                  text3: "رس",
                ),
                Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
