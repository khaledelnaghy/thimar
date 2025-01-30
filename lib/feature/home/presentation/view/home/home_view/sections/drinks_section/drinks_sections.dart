import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_event.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinksSections extends StatefulWidget {
  const DrinksSections({super.key});

  @override
  State<DrinksSections> createState() => _DrinksSectionsState();
}

class _DrinksSectionsState extends State<DrinksSections> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(CategoryDrinksHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: buttonColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        centerTitle: true,
        title: Text(
          'مشروبات',
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is CategoriesDrinksSuccessState ||
            current is CategoriesDrinksLoadingState,
        builder: (context, state) {
          if (state is CategoriesDrinksSuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    color: buttonColor,
                    Icons.search,
                    size: 50,
                  ),
                ),
                Text(
                  'لا يوجد مشروبات حاليا',
                )
              ],
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
