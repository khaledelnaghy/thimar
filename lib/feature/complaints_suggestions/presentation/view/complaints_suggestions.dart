import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/complaints_suggestions/data/model/request/common_suggestion_params.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_bloc.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_event.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_state.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ComplaintsSuggestions extends StatefulWidget {
  const ComplaintsSuggestions({super.key});

  @override
  State<ComplaintsSuggestions> createState() => _ComplaintsSuggestionsState();
}

class _ComplaintsSuggestionsState extends State<ComplaintsSuggestions> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formkey,
          child: BlocConsumer<CommonSuggestionBloc, CommonSuggestionState>(
            listener: (context, state) {
              if (state is ShowCommonSuggestionSuccess) {
                scaffoldMessenger(context, "تم إضافة الشكوي");
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(60),
                    CustomAppBarRow(
                      text: "الشكاوي والإقتراحات",
                      iconButton: Icons.arrow_back_ios_new,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Gap(40),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'الإسم'),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخال الاسم';
                        }
                        return null;
                      },
                    ),
                    Gap(10),
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: 'رقم الموبايل'),
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخال رقم الهاتف';
                        }
                        return null;
                      },
                    ),
                    Gap(10),
                    TextFormField(
                      maxLines: 4,
                      decoration: const InputDecoration(hintText: 'الموضوع'),
                      controller: contentController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخال المحتوي';
                        }
                        return null;
                      },
                    ),
                    Gap(20),
                    CustomButton(
                      text: "إرسال",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<CommonSuggestionBloc>().add(
                                ShowCommonSuggestionEvent(
                                  params: SuggestionsParams(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      content: contentController.text),
                                ),
                              );
                        }
                      },
                      color: buttonColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
