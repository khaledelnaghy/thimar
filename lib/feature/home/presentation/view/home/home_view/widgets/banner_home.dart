import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerHomeView extends StatefulWidget {
  const BannerHomeView({super.key});

  @override
  State<BannerHomeView> createState() => _BannerHomeViewState();
}

class _BannerHomeViewState extends State<BannerHomeView> {
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is BannerSuccessState || current is BannerLoadingState,
        builder: (context, state) {
          if (state is BannerSuccessState) {
            var banner = context.read<HomeBloc>().bannerHomeResponseModel?.data;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: CarouselSlider.builder(
                    itemCount: banner?.length,
                    options: CarouselOptions(
                      onPageChanged: (value, reasons) {
                        setState(() {
                          initialPage = value;
                        });
                      },
                      viewportFraction: 0.999,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      //enlargeFactor => speed of animation to navigate
                      enlargeFactor: 0.2,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder:
                        (BuildContext ctx, int index, int pageViewIndex) =>
                            ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: SizedBox(
                        height: 120,
                        child: Image.network(
                          banner?[initialPage].media ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(5),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: buttonColor),
                    child: SmoothPageIndicator(
                        controller: PageController(
                            initialPage: initialPage), // PageController
                        count: banner?.length ?? 0,
                        effect: WormEffect(
                            dotColor: Colors.green.shade100,
                            dotWidth: 14,
                            activeDotColor:
                                Colors.white), // your preferred effect
                        onDotClicked: (index) {
                          initialPage = index;
                        }),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
