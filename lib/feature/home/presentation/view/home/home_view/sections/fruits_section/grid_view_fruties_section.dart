import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_event.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class GridViewFrutiesSection extends StatefulWidget {
  const GridViewFrutiesSection({super.key, this.itemCount, this.physics});
  final int? itemCount;
  final ScrollPhysics? physics;

  @override
  State<GridViewFrutiesSection> createState() => _GridViewFrutiesSectionState();
}

class _GridViewFrutiesSectionState extends State<GridViewFrutiesSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CategoriesFruitsHome());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is CategoriesFrutiesSuccessState ||
          current is CategoriesFrutiesErrorState,
      builder: (context, state) {
        if (state is CategoriesFrutiesSuccessState) {
          var item =
              context.read<HomeBloc>().categoryFrutiesResponseModel?.data;
          return GridView.builder(
            itemCount: item?.length,
            // shrinkWrap: true,
            physics: widget.physics ?? NeverScrollableScrollPhysics(),
            controller: ScrollController(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
              mainAxisSpacing: 40,
              crossAxisSpacing: 2,
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
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              item?[index].mainImage ?? "",
                              height: 130,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 125,
                          right: 85,
                          child: Container(
                            padding: EdgeInsets.only(top: 1),
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                //  topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: buttonColor,
                            ),
                            child: Text(
                              '   ${item?[index].discount?.toString() ?? ""}%-    ',
                              textAlign: TextAlign.start,
                              style: Styles.textStyle14.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(5),
                    Text(
                      item?[index].title ?? "",
                      style: Styles.textStyle15,
                    ),
                    Text(
                      "السعر/ 1كجم",
                      style:
                          Styles.textStyle12.copyWith(color: Color(0xff808080)),
                    ),
                    Row(
                      children: [
                        Text(
                          item?[index].price?.toString() ?? "",
                          style: Styles.textStyle15.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4C8613)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${item?[index].priceBeforeDiscount?.toString() ?? ""}رس',
                          style: Styles.textStyle13.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: buttonColor,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 30,
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
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
