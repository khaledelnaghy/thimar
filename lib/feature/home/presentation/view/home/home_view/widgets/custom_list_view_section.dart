import 'dart:developer';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/sections/drinks_section/drinks_sections.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/sections/fruits_section/frutes_sections.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/sections/meals_section/meals_sections.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/sections/vegetables_section/vegetables_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewSection extends StatelessWidget {
  const CustomListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (revious, current) =>
          current is CategoriesSuccessState || current is CategoriesLodingState,
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          log('mmmmm');
          var item = context.read<HomeBloc>().categoryHomeResponseModel?.data;
          return ListView.builder(
              // shrinkWrap: true,
              itemCount: item?.length,
              // controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (index == 0) {
                          push(context, const FruitsSectionScreen());
                        } else if (index == 1) {
                          push(context, const VegetablesSections());
                        }
                        if (index == 2) {
                          push(context, const MealsSections());
                        } else if (index == 3) {
                          push(context, const DrinksSections());
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey),
                        child: Image.network(
                          item?[index].media ?? "",
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      item?[index].name ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                );
              });
        } else {
          log('sssssss');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// Column(
//                       children: [
//                         Container(
//                             height: 45,
//                             width: 45,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color.fromARGB(255, 238, 223, 221),
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 GoRouter.of(context)
//                                     .push(AppRouter.listViewItemClick);
//                               },
//                               child: Image.asset(
//                                 AssetData.steak,
//                               ),
//                             )),
//                         Text(
//                           "اللحوم",
//                           style: Styles.textStyle20.copyWith(fontSize: 18),
//                         ),
//                       ],
//                     ),
