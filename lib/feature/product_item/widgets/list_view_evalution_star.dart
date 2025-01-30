import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ListViewEvalutionStar extends StatelessWidget {
  const ListViewEvalutionStar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductEvaluationSuccessState ||
          current is ProductEvaluationLoadingState,
      builder: (context, state) {
        if (state is ProductEvaluationSuccessState) {
          var productEvaluationItem = context
              .read<HomeBloc>()
              .listviewProductEvalutionResponseModel
              ?.data;
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productEvaluationItem?.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 90,
                  width: 250,
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                productEvaluationItem?[index].clientName ?? "",
                                style: Styles.textStyle15
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            StarRating(
                              rating: (productEvaluationItem?[index].value ?? 0)
                                  .toDouble(),
                              size: 17,
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        productEvaluationItem?[index].comment ?? "",
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            productEvaluationItem?[index].clientImage ?? ""),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
