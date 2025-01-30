import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_event.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomListViewCartItem extends StatefulWidget {
  const CustomListViewCartItem({
    super.key,
    this.textName,
    this.textPrice,
    this.onTapAdd,
    this.onTapMinus,
    this.iconAdd,
    this.onTapDelete,
    this.iconMinus,
    this.iconDelete,
  });

  final String? textName;
  final String? textPrice;
  final void Function()? onTapAdd;
  final void Function()? onTapMinus;
  final void Function()? onTapDelete;
  final IconData? iconAdd;
  final IconData? iconMinus;

  final String? iconDelete;

  @override
  State<CustomListViewCartItem> createState() => _CustomListViewCartItemState();
}

class _CustomListViewCartItemState extends State<CustomListViewCartItem> {
  @override
  Widget build(BuildContext context) {
    // double count = 1;
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is DeleteCartSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                // side:   BorderSide(color: Colors.green.withAlpha(100)),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 200),
              content: Text(
                "تم الحذف",
                style: Styles.textStyle15.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is ShowCartSuccessState || current is ShowCartLoadingState,
      builder: (context, state) {
        if (state is ShowCartSuccessState) {
          var cartData = context.read<CartBloc>().showCartResponseModels?.data;

          return ListView.builder(
              itemCount: cartData?.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          cartData?[index].image ?? "",
                          height: 75,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                        Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartData?[index].title ?? "طط",
                              // widget.textName ?? "",
                              style: Styles.textStyle15,
                            ),
                            Text(
                              "${cartData?[index].price} ر.س",
                              // widget.textPrice ?? "",
                              style: Styles.textStyle13
                                  .copyWith(color: buttonColor),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 4),
                              width: 110,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          context.read<CartBloc>().add(
                                              UpdateCartEvent(
                                                  amount: ((cartData![index]
                                                              .amount!) +
                                                          1)
                                                      .toString(),
                                                  id: cartData[index].id!));
                                          context
                                              .read<CartBloc>()
                                              .add(ShowCartEvent());
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: accionColr,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${cartData?[index].amount}',
                                    style: Styles.textStyle11
                                        .copyWith(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          context.read<CartBloc>().add(
                                              UpdateCartEvent(
                                                  amount: ((cartData![index]
                                                              .amount!) -
                                                          1)
                                                      .toString(),
                                                  id: cartData[index].id!));
                                          context
                                              .read<CartBloc>()
                                              .add(ShowCartEvent());
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: accionColr,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              setState(() {
                                context.read<CartBloc>().add(
                                    DeleteCartEvent(id: cartData![index].id!));
                                context.read<CartBloc>().add(ShowCartEvent());
                              });
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/delete.svg',
                            fit: BoxFit.cover,
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
