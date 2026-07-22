import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/advertisement/data/ad_models.dart';
import 'package:mostkdm/features/advertisement/presentation/view/add_ad_view.dart';
import 'package:mostkdm/features/advertisement/presentation/view/ads_datails_view.dart';
import 'package:mostkdm/features/auth/presentation/view/change_password_view.dart';
import 'package:mostkdm/features/auth/presentation/view/login_view.dart';
import 'package:mostkdm/features/auth/presentation/view/phone_otp.dart';
import 'package:mostkdm/features/auth/presentation/view/signup_view.dart';
import 'package:mostkdm/features/auth/presentation/view/otp_code_view.dart';
import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/presentation/view/chat_details_view.dart';
import 'package:mostkdm/features/commission/presentation/view/commission_view.dart';
import 'package:mostkdm/features/favorite/presentation/view/favorites_view.dart';
import 'package:mostkdm/features/home/presentation/section/home_featured_ads_section.dart';
import 'package:mostkdm/features/home/presentation/view/ads_view.dart';
import 'package:mostkdm/features/home/presentation/view/categories_view.dart';
import 'package:mostkdm/features/home/presentation/view/sub_category_view.dart';
import 'package:mostkdm/features/main/presentation/view/main_view.dart';
import 'package:mostkdm/features/notification/presentation/view/notification_view.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/choose_access.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/splash_view.dart';
import 'package:mostkdm/features/search/presentation/view/search_view.dart';
import 'package:mostkdm/features/settings/presentation/view/edit_profile_view.dart';
import 'package:mostkdm/features/settings/presentation/view/more_view.dart';
import 'package:mostkdm/features/policies/presentation/policy_view.dart';
import 'package:mostkdm/features/settings/presentation/view/profile_view.dart';
import 'package:mostkdm/features/subscription/presentation/view/package_details_view.dart';
import 'package:mostkdm/features/subscription/presentation/view/subscriptions_view.dart';
import 'package:mostkdm/features/wallet/presentation/view/bank_account_view.dart';

import 'package:mostkdm/features/wallet/presentation/view/wallet_view.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashView(),
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
    GoRoute(
      path: RouteNames.forgetPassword,
      builder: (context, state) => const PhoneOtp(),
    ),

    GoRoute(
  path: RouteNames.sendotp,
  builder: (context, state) {
    final args = state.extra as Map<String, dynamic>;
    return OtpcodeView(
      phoneNumber: args['phone'] as String,
      isForgetPassword: args['isForgotPassword'] as bool? ?? false,
    );
  },
),
    

    GoRoute(
  path: RouteNames.changePassword,
  builder: (context, state) {
    final args = state.extra as Map<String, dynamic>?;
    return ChangePasswordView(
      phone: args?['phone'] as String?,
      code: args?['code'] as String?,
    );
  },
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
      builder: (context, state) {
        final adId = state.extra as String;

        return AdsDatailsView(
          adId: adId,
        );
      },
    ),

    GoRoute(
      path: RouteNames.addAd,
      builder: (context, state) => AddAdView(
        ad: state.extra as AdDetailsModel?,
      ),
    ),
    GoRoute(
      path: RouteNames.showNotification,
      builder: (context, state) => NotificationsView(),
    ),
    GoRoute(
      path: RouteNames.chatDetails,
      builder: (context, state) => ChatDetailsView(
        chat: state.extra as ChatModel,
      ),
    ),

    // app_router.dart
    GoRoute(
      path: RouteNames.more,
      builder: (context, state) => const MoreView(),
    ),
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: RouteNames.editProfile,
      builder: (context, state) => const EditProfileView(),
    ),
    GoRoute(
      path: RouteNames.wallet,
      builder: (context, state) => const WalletView(),
    ),
    GoRoute(
      path: RouteNames.bankAccount,
      builder: (context, state) => const BankAccountView(),
    ),
    GoRoute(
      path: RouteNames.subscriptions,
      builder: (context, state) => const SubscriptionsView(),
    ),
    GoRoute(
      path: RouteNames.packageDetails,
      builder: (context, state) => PackageDetailsView(
        isActive: (state.extra ?? false) as bool,
      ),
    ),

    GoRoute(
        path: RouteNames.favorites,
        builder: (context, state) => FavoritesView()),
    GoRoute(
        path: RouteNames.notifications,
        builder: (context, state) => NotificationsView()),
    GoRoute(
      path: RouteNames.commission,
      builder: (context, state) => const CommissionView(),
    ),
    GoRoute(
      path: RouteNames.policy,
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return PolicyView(
          title: args['title'] as String,
          content: args['content'] as String,
          icon: args['icon'] as String,
        );
      },
    ),
  ],
);
