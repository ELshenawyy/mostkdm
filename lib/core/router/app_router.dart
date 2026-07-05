import 'package:go_router/go_router.dart';
import 'package:mostkdm/core/router/router_names.dart';
import 'package:mostkdm/features/auth/presentation/view/change_password_view.dart';
import 'package:mostkdm/features/auth/presentation/view/login_view.dart';
import 'package:mostkdm/features/auth/presentation/view/phone_otp.dart';
import 'package:mostkdm/features/auth/presentation/view/signup_view.dart';
import 'package:mostkdm/features/auth/presentation/view/otp_code_view.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/choose_access.dart';
import 'package:mostkdm/features/onBoarding/presentation/view/splash_view.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const ChangePasswordView(),
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
  ],
);
