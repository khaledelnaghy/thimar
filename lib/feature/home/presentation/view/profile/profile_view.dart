import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/app_router.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/home/presentation/view/profile/widgets/custom_data_person.dart';
import 'package:Thimar/feature/home/presentation/view/profile/widgets/custom_details_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accionColr,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: CustomDataPerson(
                    myAccount: "حسابي",
                    myPhone: "0123456789",
                    name: "خالد الناغي",
                    photo: AssetData.profilePhoto,
                  ),
                ),
                Gap(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomDetailsProfile(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.personData);
                        },
                        text: "المعلومات الشخصية",
                        icon: AssetData.personicon,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.wallet);
                        },
                        text: "المحفظة",
                        icon: AssetData.ma7fza,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                            GoRouter.of(context).push(AppRouter.address);
                        },
                        text: "العناوين",
                        icon: AssetData.location,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.pay);
                        },
                        text: "الدفع",
                        icon: AssetData.pay,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.qusetions);
                        },
                        text: "اسئلة متكررة",
                        icon: AssetData.question,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.policy);
                        },
                        text: "سياسةالخصوصية",
                        icon: AssetData.policy,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.calling);
                        },
                        text: "تواصل معنا",
                        icon: AssetData.calling,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.complaintsSuggestions);
                        },
                        text: "الشكاوي والإقتراحات",
                        icon: AssetData.shakwa,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {},
                        text: "مشاركه التطبيق",
                        icon: AssetData.share,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.aboutApp);
                        },
                        text: "عن التطبيق",
                        icon: AssetData.informatioApp,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {},
                        text: "تغير اللغة",
                        icon: AssetData.changeLanguage,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {},
                        text: "الشروط والاحكام",
                        icon: AssetData.a7kam,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {},
                        text: "تقييم التطبيق",
                        icon: AssetData.stars,
                      ),
                      Gap(15),
                      CustomDetailsProfile(
                        onTap: () {
                           GoRouter.of(context).push(AppRouter.loginView);
                        },
                        text: "تسجيل الخروج",
                        icon: AssetData.logout,
                      ),
                      Gap(15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
