import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_event.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_state.dart';
import 'package:Thimar/feature/favourite/presentation/widget/grid_view_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(ShowFavoriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100),
              child: IconButton(
                iconSize: 25,
                onPressed: () {
                  Navigator.of(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: buttonColor,
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'المفضله',
            style: Styles.textStyle20
                .copyWith(color: buttonColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          buildWhen: (previous, current) =>
              current is FavoriteLoadingState ||
              current is FavoriteSuccessState,
          builder: (context, state) {
            if (state is FavoriteSuccessState) {
              // var item =
              //     context.read<FavoriteBloc>().favoriteResponseModel?.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  GridViewFav(),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
