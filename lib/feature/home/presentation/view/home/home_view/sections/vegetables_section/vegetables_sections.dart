import 'package:Thimar/feature/auth/presentation/widget/cutom_text_form.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/sections/vegetables_section/grid_view_vegetables.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class VegetablesSections extends StatelessWidget {
  const VegetablesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomAppBarRow(
              iconButton: Icons.arrow_back_ios_new,
              onPressed: () {
                Navigator.pop(context);
              },
              text: "خضراوات",
            ),
          ),
          const Gap(20),
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
          Expanded(
            child: GridViewVegetables(),
          ),
        ],
      ),
    );
  }
}
