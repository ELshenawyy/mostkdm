import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/advertisement/presentation/view/add_ad_view.dart';
import 'package:mostkdm/features/advertisement/presentation/view/ads_datails_view.dart';
import 'package:mostkdm/features/auth/presentation/view/change_password_view.dart';
import 'package:mostkdm/features/auth/presentation/view/login_view.dart';
import 'package:mostkdm/features/auth/presentation/view/phone_otp.dart';
import 'package:mostkdm/features/auth/presentation/view/signup_view.dart';
import 'package:mostkdm/features/auth/presentation/view/otp_code_view.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';
import 'package:mostkdm/features/home/presentation/view/ads_view.dart';
import 'package:mostkdm/features/home/presentation/view/categories_view.dart';
import 'package:mostkdm/features/home/presentation/view/sub_category_view.dart';
import 'package:mostkdm/features/main/presentation/view/main_view.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/choose_access.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/splash_view.dart';
import 'package:mostkdm/features/search/presentation/view/search_view.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: RouteNames.signup,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RouteNames.chooseAccess,
      builder: (context, state) => const ChooseAccess(),
    ),
    // app_router.dart
    GoRoute(
      path: RouteNames.phoneOtp,
      builder: (context, state) => const OtpcodeView(),
    ),
    GoRoute(
      path: RouteNames.categories,
      builder: (context, state) => const CategoriesView(),
    ),
    GoRoute(
      path: RouteNames.mainView,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: RouteNames.ads,
      builder: (context, state) => const AdsView(),
    ),
    GoRoute(
      path: RouteNames.subCategory,
      builder: (context, state) => SubCategoryView(
        title: state.extra as String? ?? '',
      ),
    ),
    GoRoute(
      path: RouteNames.search,
      builder: (context, state) => SearchView(),
    ),
    GoRoute(
      path: RouteNames.adsDetails,
      builder: (context, state) => const AdsDatailsView(),
    ),
    GoRoute(
  path: RouteNames.addAd,
  builder: (context, state) => const AddAdView(),
),
  ],
);
