import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/about_app/presentation/bloc/about_app_bloc.dart';
import 'package:Thimar/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:Thimar/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/bloc/common_suggestion_bloc.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_bloc.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_bloc.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_bloc.dart';
import 'package:Thimar/feature/policy/presentation/bloc/policy_bloc.dart';
import 'package:Thimar/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:Thimar/feature/questions/presentation/bloc/questions_bloc.dart';
import 'package:Thimar/feature/splash/presentation/view/splash_screen.dart';
import 'package:Thimar/feature/terms/presentation/bloc/term_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//navigate without Context
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await LocalStorage.init();
  runApp(const Thimar());
  //SystemChrome => تعديل الاتجاهات
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class Thimar extends StatelessWidget {
  const Thimar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => PolicyBloc(),
        ),
        BlocProvider(
          create: (context) => QuestionsBloc(),
        ),
        BlocProvider(
          create: (context) => CommonSuggestionBloc(),
        ),
        BlocProvider(
          create: (context) => AboutAppBloc(),
        ),
        BlocProvider(
          create: (context) => TermBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        builder: (context, child) {
          return Directionality(
              textDirection: TextDirection.rtl, child: child!);
        },
        theme: ThemeData(
          dividerColor: Colors.transparent,
          fontFamily: 'Tajawal',
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xffDCDCDC)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xffDCDCDC)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Color(0xffDCDCDC)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color(0xffDCDCDC),
              ),
            ),
          ),
        ),
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
