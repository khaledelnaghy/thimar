import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/core/widgets/custom_icons.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_bloc.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_event.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  void initState() {
    super.initState();
    context.read<PolicyBloc>().add(ShowPolicyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomIcons(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: buttonColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'سياسة الخصوصية',
          style: Styles.textStyle16.copyWith(fontSize: 20, color: buttonColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 13,
          right: 13,
          top: 42,
        ),
        child: BlocBuilder<PolicyBloc, PolicyState>(
            buildWhen: (previous, current) =>
                current is PolicySuccess || current is PolicyLoading,
            builder: (context, state) {
              if (state is PolicySuccess) {
                var item =
                    context.read<PolicyBloc>().showPolicyResponseModels?.data;

                return Column(
                  children: [
                    Expanded(
                      child: HtmlWidget(
                        item?.policy ?? "",
                        textStyle: Styles.textStyle15,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
