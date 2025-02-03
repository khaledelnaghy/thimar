import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/profile/presentation/view/profile_view.dart';
import 'package:Thimar/feature/favourite/presentation/view/favourite_view.dart';
import 'package:Thimar/feature/notification/notification_view.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/home_view.dart';
import 'package:Thimar/feature/talabaty/talabaty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationbarView extends StatefulWidget {
  const NavigationbarView({super.key, this.index = 0});
  final int index;
  @override
  State<NavigationbarView> createState() => _NavigationbarViewState();
}

class _NavigationbarViewState extends State<NavigationbarView> {
  int selectedIconTheme = 0;
  List<Widget> page = [
    const HomeView(),
    const TalabatyView(),
    const NotificationView(),
    const FavouriteView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: page[selectedIconTheme],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: buttonColor,

            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            currentIndex: selectedIconTheme,
            onTap: (value) {
              setState(() {
                selectedIconTheme = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/Home.svg'),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/Home.svg',
                    // colorFilter:
                    //     const ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetData.talabaty),
                  activeIcon: SvgPicture.asset(
                    AssetData.talabaty,
                    // colorFilter:
                    //     const ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  label: 'طلباتي'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetData.notification),
                  activeIcon: SvgPicture.asset(
                    AssetData.notification,
                    // colorFilter:
                    //     const ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  label: 'الإشعارات'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetData.favourite,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetData.favourite,
                    // colorFilter:
                    //     const ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  label: 'المفضلة'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetData.profile,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetData.profile,
                    // colorFilter:
                    //     const ColorFilter.mode(buttonColor, BlendMode.srcIn),
                  ),
                  label: 'حسابي'),
            ]),
      ),
    );
  }
}
