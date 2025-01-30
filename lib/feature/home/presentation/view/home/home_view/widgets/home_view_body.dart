import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_event.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/add_address_bottom_sheet.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/banner_home.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_app_bar.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_grid_view_item.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_list_view_section.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/widgets/custom_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ShowHome());
    context.read<HomeBloc>().add(BannerHome());
    context.read<HomeBloc>().add(CategoriesHome());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomAppBar(
                  // tag: AddAddressBottomSheet,
                  onPressedDrawer: () {
                    // push(context, const CartView());
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
              BannerHomeView(),
              Gap(20),
              CustomTextRow(
                textSections: "الأقسام",
                textCategories: "عرض الكل",
              ),
              Gap(10),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: CustomListViewSection()),
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
        SliverFillRemaining(child: CustomGridViewItem()),
      ],
    );
  }
}
