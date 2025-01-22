import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/feature/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
     animationController.dispose();
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Gap(250),
          SvgPicture.asset(
            AssetData.splashLogo,
            height: 108,
            width: 80,
          ),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, child) => SlideTransition(
              position: slidingAnimation,
              child: Text(
                logo,
                style: TextStyle(fontSize: 30, color: buttonColor),
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(AssetData.bottomLogo),
          ),
          Gap(10),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    slidingAnimation = Tween<Offset>(begin: Offset(0, 1.5), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      pushAndRemoveUntil(context, const LoginView());
    });
  }
}
 // String isLogin = LocalStorage.getData(key: LocalStorage.token) ?? "";
 // if (isLogin.isNotEmpty) {
      //   // ignore: use_build_context_synchronously
      //   pushAndRemoveUntil(context, const NavigationbarView());
      // } else {
      //   pushAndRemoveUntil(context, const LoginView());
      // }
