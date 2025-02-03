import 'package:Thimar/core/widgets/navigation_view.dart';
import 'package:Thimar/feature/about_app/presentation/view/about_app.dart';
import 'package:Thimar/feature/address/presentation/view/address.dart';
import 'package:Thimar/feature/auth/presentation/view/forget_password.dart';
import 'package:Thimar/feature/auth/presentation/view/login_view.dart';
import 'package:Thimar/feature/auth/presentation/view/new_password.dart';
import 'package:Thimar/feature/auth/presentation/view/register_view.dart';
import 'package:Thimar/feature/auth/presentation/view/resend_code.dart';
import 'package:Thimar/feature/calling/calling.dart';
import 'package:Thimar/feature/complaints_suggestions/presentation/view/complaints_suggestions.dart';
import 'package:Thimar/feature/cart/presentation/view/cart_view.dart';
import 'package:Thimar/feature/done_order/presentation/view/done_order.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/list_view_item_click.dart';
import 'package:Thimar/feature/profile/presentation/view/profile_view.dart';
import 'package:Thimar/feature/favourite/presentation/view/favourite_view.dart';
import 'package:Thimar/feature/notification/notification_view.dart';
import 'package:Thimar/feature/home/presentation/view/home/home_view/home_view.dart';
import 'package:Thimar/feature/talabaty/talabaty_view.dart';
import 'package:Thimar/feature/pay/pay.dart';
import 'package:Thimar/feature/person_data/person_data.dart';
import 'package:Thimar/feature/policy/presentation/view/policy.dart';
import 'package:Thimar/feature/questions/presentation/view/qusetions.dart';
import 'package:Thimar/feature/shipping%20_now/shiping_now.dart';
import 'package:Thimar/feature/splash/presentation/view/splash_screen.dart';
import 'package:Thimar/feature/talabaty/widgets/list_view_current_order.dart';
import 'package:Thimar/feature/transaction_history/transaction_history.dart';
import 'package:Thimar/feature/wallet/wallet.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const loginView = '/loginView';
  static const registerView = '/registerView';
  static const forgetPassword = '/forgetPassword';
  static const resentCode = '/resentCode';
  static const newPassword = '/newPassword';
  static const navigationBarView = '/navigationBarView';

  static const homeView = '/homeView';
  static const favouriteView = '/favouriteView';
  static const talabatyView = '/talabatyView';
  static const notificationView = '/notificationView';
  static const profileView = '/profileView';
  static const basket = '/basketView';
  static const doneOrder = '/doneOrder';
  static const detailsOrder = '/detailsOrder';

  static const personData = '/personData';
  static const wallet = '/wallet';
  static const shipingNow = '/shipingNow';
  static const transactionHistory = '/transactionHistory';
  static const address = '/address';
  static const pay = '/pay';

  static const qusetions = '/qusetions';
  static const policy = '/policy';

  static const calling = '/calling';
  static const complaintsSuggestions = '/complaintsSuggestions';
  static const aboutApp = '/aboutApp';
  static const listViewItemClick = '/listViewItemClick';
  static const productItem = '/productItem';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(
      path: aboutApp,
      builder: (context, state) => AboutApp(),
    ),
    GoRoute(
      path: loginView,
      builder: (context, state) => LoginView(),
    ),
    // GoRoute(
    //   path: productItem,
    //   builder: (context, state) => ProductItem(),
    // ),
    GoRoute(
      path: listViewItemClick,
      builder: (context, state) => ListViewItemClick(),
    ),
    GoRoute(
      path: shipingNow,
      builder: (context, state) => ShipingNow(),
    ),
    GoRoute(
      path: complaintsSuggestions,
      builder: (context, state) => ComplaintsSuggestions(),
    ),
    GoRoute(
      path: wallet,
      builder: (context, state) => Wallet(),
    ),
    GoRoute(
      path: pay,
      builder: (context, state) => Pay(),
    ),
    GoRoute(
      path: transactionHistory,
      builder: (context, state) => TransactionHistory(),
    ),
    // GoRoute(
    //   path: address,
    //   builder: (context, state) => Address(),
    // ),
    GoRoute(
      path: personData,
      builder: (context, state) => PersonData(),
    ),
    GoRoute(
      path: registerView,
      builder: (context, state) => RegisterView(),
    ),
    GoRoute(
      path: detailsOrder,
      builder: (context, state) => CurrentListView(),
    ),
    GoRoute(
      path: doneOrder,
      builder: (context, state) => DoneOrder(),
    ),
    GoRoute(
      path: forgetPassword,
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(
      path: basket,
      builder: (context, state) => CartView(),
    ),
    GoRoute(
      path: resentCode,
      builder: (context, state) => ResentCode(),
    ),
    GoRoute(
      path: newPassword,
      builder: (context, state) => NewPassword(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: favouriteView,
      builder: (context, state) => FavouriteView(),
    ),
    GoRoute(
      path: talabatyView,
      builder: (context, state) => TalabatyView(),
    ),
    GoRoute(
      path: notificationView,
      builder: (context, state) => NotificationView(),
    ),
    // GoRoute(
    //   path: profileView,
    //   builder: (context, state) => ProfileView(),
    // ),
    GoRoute(
      path: navigationBarView,
      builder: (context, state) => NavigationbarView(),
    ),
    GoRoute(
      path: qusetions,
      builder: (context, state) => Qusetions(),
    ),
    GoRoute(
      path: policy,
      builder: (context, state) => Policy(),
    ),
    GoRoute(
      path: calling,
      builder: (context, state) => Calling(),
    ),
  ]);
}
