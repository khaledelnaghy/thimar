import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_bloc.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_event.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Qusetions extends StatefulWidget {
  const Qusetions({super.key});

  @override
  State<Qusetions> createState() => _QusetionsState();
}

class _QusetionsState extends State<Qusetions> {
  @override
  void initState() {
    super.initState();
    context.read<QuestionsBloc>().add(ShowQuestionEvevnt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              )),
        ),
        title: Text('الاسئله المتكرره', style: Styles.textStyle16),
        centerTitle: true,
      ),
      body: BlocBuilder<QuestionsBloc, QuestionsState>(
        buildWhen: (previous, current) =>
            current is QuestionsSuccess || current is QuestionsLoading,
        builder: (context, state) {
          if (state is QuestionsSuccess) {
            var item =
                context.read<QuestionsBloc>().showQuestionResponseModels?.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: item?.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          // trailing: const Icon(
                          //   Icons.arrow_downward_outlined,
                          //   color: buttonColor,
                          // ),
                          title: Text(
                            item?[index].question ?? "",
                            style:
                                Styles.textStyle16.copyWith(color: buttonColor),
                          ),
                          children: [
                            Text(
                              maxLines: 5,
                              item?[index].answer ?? "",
                              style: Styles.textStyle16
                                  .copyWith(color: buttonColor),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
