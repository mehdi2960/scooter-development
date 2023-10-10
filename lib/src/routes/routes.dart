import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scooter/src/features/about_us/page/about_us_screen.dart';
import 'package:scooter/src/features/accident_report/page/accident_report_screen.dart';
import 'package:scooter/src/features/break_down_report/page/break_down_reporst_screen.dart';
import 'package:scooter/src/features/detaill_screen/page/detail_screen.dart';
import 'package:scooter/src/features/drawer/page/drawer_screen.dart';
import 'package:scooter/src/features/home/widgets/success_payment_bottom_sheet.dart';
import 'package:scooter/src/features/how_to_ride/page/how_to_ride_screen.dart';
import 'package:scooter/src/features/messages/page/messages_screen.dart';
import 'package:scooter/src/features/national_code/page/national_code_screen.dart';
import 'package:scooter/src/features/payment_history/page/payment_history_screen.dart';
import 'package:scooter/src/features/ride_history/page/ride_history_screen.dart';
import 'package:scooter/src/features/ride_screen/page/end_ride_screen.dart';
import 'package:scooter/src/features/safe_points/page/safe_point_screen.dart';
import 'package:scooter/src/features/scan_code/widgets/qr_code_widget.dart';
import 'package:scooter/src/features/settings/page/settings_screen.dart';
import 'package:scooter/src/features/sign_up/page/sign_up_screen.dart';
import 'package:scooter/src/features/support/page/support_screen.dart';
import 'package:scooter/src/features/trip_screen/page/end_trip_screen.dart';
import 'package:scooter/src/features/trip_will_start/page/trip_will_start_screen.dart';
import 'package:scooter/src/features/user_info/page/user_info_screen.dart';
import 'package:scooter/src/features/wrong_park_report/page/wrong_park_report_screen.dart';

import '/src/routes/routes_path.dart';
import '../features/home/page/home_screen.dart';
import '../features/login/page/login_screen.dart';
import '../features/on_boarding/page/on_boarding_screen.dart';
import '../features/otp/page/otp_screen.dart';
import '../features/profile_setting/page/profile_setting_screen.dart';
import '../features/scan_code/page/scan_code_screen.dart';
import '../features/splash/page/splash_screen.dart';

class Routes {
  Routes._();

  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: RoutesPath.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.scanCode,
        builder: (BuildContext context, GoRouterState state) {
          return const ScanCodeScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.tripWillStart,
        builder: (BuildContext context, GoRouterState state) {
          return const TripWillStartScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.qrWidget,
        builder: (BuildContext context, GoRouterState state) {
          return const QrWidget();
        },
      ),
      GoRoute(
        path: RoutesPath.safePonis,
        builder: (BuildContext context, GoRouterState state) {
          return const HowToRideScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.drawer,
        builder: (BuildContext context, GoRouterState state) {
          return const DrawerScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.aboutUs,
        builder: (BuildContext context, GoRouterState state) {
          return const AboutUsScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.rideHistory,
        builder: (BuildContext context, GoRouterState state) {
          return const RideHistoryScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.support,
        builder: (BuildContext context, GoRouterState state) {
          return const SupportScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.accidentReport,
        builder: (BuildContext context, GoRouterState state) {
          return const AccidentReportScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.breakdownReport,
        builder: (BuildContext context, GoRouterState state) {
          return const BreakDownReportScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.wrongParkReport,
        builder: (BuildContext context, GoRouterState state) {
          return const WrongParkReportScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.profile,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileSettingsScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.messages,
        builder: (BuildContext context, GoRouterState state) {
          return const MessagesScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.userInfo,
        builder: (BuildContext context, GoRouterState state) {
          return const UserInfoScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.paymentHistory,
        builder: (BuildContext context, GoRouterState state) {
          return const PaymentHistoryScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.settingsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.register,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.otp,
        builder: (BuildContext context, GoRouterState state) {
          final bool? isLoginScreen = state.extra as bool?;
          return OTPScreen(isLoginScreen: isLoginScreen);
        },
      ),
      GoRoute(
        path: RoutesPath.endRideScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EndRideScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.tripscreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EndTripScreen();
        },
      ),
      GoRoute(
          path: RoutesPath.detailScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const DetailScreen();
          }),
      GoRoute(
        path: RoutesPath.nationalCode,
        builder: (BuildContext context, GoRouterState state) {
          return const NationalCodeScreen();
        },
      ),
      GoRoute(
        path: RoutesPath.howToRide,
        builder: (BuildContext context, GoRouterState state) {
          return const SafePointScreen();
        },
      ),
    ],
  );
}
