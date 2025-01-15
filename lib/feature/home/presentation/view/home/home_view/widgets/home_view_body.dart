import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:Thimar/feature/home/presentation/view/home/add_address_bottom_sheet/widgets/add_address_bottom_sheet.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_app_bar.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_grid_view_item.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_list_view_section.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_text_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomAppBar(
                    // tag: AddAddressBottomSheet,
                    onPressedDrawer: () {
                      GoRouter.of(context).push(AppRouter.basket);
                    },
                    onPressedAdrees: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return const AddAddressBottomSheet();
                          });
                    },
                    iconButton: Icon(
                      FontAwesomeIcons.seedling,
                      color: buttonColor,
                    ),
                    textDriver: "التوصيل إلي \n شارع فهد الملك - جدة",
                    textIcon: "سلة ثمار",
                  ),
                ),
                Gap(20),
                CutomTextFormField(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey[100],
                  hintText: "أبحث عن ما تريد؟",
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Color(0xffB9C9A8),
                    size: 20,
                  ),
                ),
                Gap(20),
                Image.asset(
                  AssetData.banner,
                ),
                Gap(20),
                CustomTextRow(
                  textSections: "الأقسام",
                  textCategories: "عرض الكل",
                ),
                Gap(10),
                CustomListViewSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "الأصناف",
                    style: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(child: CustomGridViewItem()),
      ],
    );
  }
}
