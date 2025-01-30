import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_bloc.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_event.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_state.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  void initState() {
    super.initState();
    context.read<AboutAppBloc>().add(ShowAboutApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<AboutAppBloc, AboutAppState>(
          buildWhen: (previous, current) =>
              current is AboutAppLoadingState ||
              current is AboutAppSuccessState,
          builder: (context, state) {
            if (state is AboutAppSuccessState) {
              var item =
                  context.read<AboutAppBloc>().aboutAppResponseModels?.data;
              return Column(
                children: [
                  Gap(50),
                  CustomAppBarRow(
                    iconButton: Icons.arrow_back_ios_new,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "عن التطبيق",
                  ),
                  Gap(30),
                  CustomLogo(
                    svgPicture: AssetData.splashLogo,
                    height: 170,
                    width: 70,
                  ),
                  Gap(30),
                  HtmlWidget(item?.about ?? ""),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
