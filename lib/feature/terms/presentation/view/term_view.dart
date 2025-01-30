import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_logo.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_bloc.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_event.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';

class TermView extends StatefulWidget {
  const TermView({super.key});

  @override
  State<TermView> createState() => _TermViewState();
}

class _TermViewState extends State<TermView> {
  @override
  void initState() {
    super.initState();
    context.read<TermBloc>().add(ShowTermEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<TermBloc, TermState>(
          buildWhen: (previous, current) =>
              current is TermSuccessState || current is TermLoadingState,
          builder: (context, state) {
            if (state is TermSuccessState) {
              var item = context.read<TermBloc>().termResponseModel?.data;
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
                  HtmlWidget(item?.terms ?? ""),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
