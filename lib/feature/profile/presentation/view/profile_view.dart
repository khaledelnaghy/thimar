import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/about_app/presentation/view/about_app.dart';
import 'package:Thimar/feature/address/address.dart';
import 'package:Thimar/feature/auth/presentation/view/login_view.dart';
import 'package:Thimar/feature/calling/calling.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/view/complaints_suggestions.dart';
import 'package:Thimar/feature/pay/pay.dart';
import 'package:Thimar/feature/person_data/person_data.dart';
import 'package:Thimar/feature/policy/presentation/view/policy.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_event.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_state.dart';
import 'package:Thimar/feature/profile/presentation/widgets/custom_data_person.dart';
import 'package:Thimar/feature/profile/presentation/widgets/custom_details_profile.dart';
import 'package:Thimar/feature/questions/presentation/view/qusetions.dart';
import 'package:Thimar/feature/share_app/share_app.dart';
import 'package:Thimar/feature/terms/presentation/view/term_view.dart';
import 'package:Thimar/feature/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ShowProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            pushAndRemoveUntil(context, const LoginView());
          }
        },
        builder: (context, state) {
          if (state is ShowProfileSuccess) {
            var showItem =
                context.read<ProfileBloc>().showPolicyResponseModels?.data;
            return SingleChildScrollView(
              child: Column(
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
                      myAccount: showItem?.fullname ?? "",
                      myPhone: showItem?.phone ?? "",
                      name: "خالد الناغي",
                      photo: showItem?.image ?? "",
                    ),
                  ),
                  Gap(25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, PersonData());
                          },
                          text: "المعلومات الشخصية",
                          icon: AssetData.personicon,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Wallet());
                          },
                          text: "المحفظة",
                          icon: AssetData.ma7fza,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Address());
                          },
                          text: "العناوين",
                          icon: AssetData.location,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Pay());
                          },
                          text: "الدفع",
                          icon: AssetData.pay,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Qusetions());
                          },
                          text: "اسئلة متكررة",
                          icon: AssetData.question,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Policy());
                          },
                          text: "سياسةالخصوصية",
                          icon: AssetData.policy,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, Calling());
                          },
                          text: "تواصل معنا",
                          icon: AssetData.calling,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, ComplaintsSuggestions());
                          },
                          text: "الشكاوي والإقتراحات",
                          icon: AssetData.shakwa,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, ShareApp());
                          },
                          text: "مشاركه التطبيق",
                          icon: AssetData.share,
                        ),
                        Gap(15),
                        CustomDetailsProfile(
                          onTap: () {
                            push(context, AboutApp());
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
                          onTap: () {
                            push(context, TermView());
                          },
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
                            context.read<ProfileBloc>().add(LogoutEvent());
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
