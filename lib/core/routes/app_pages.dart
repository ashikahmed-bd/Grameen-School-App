import 'package:get/get.dart';
import 'package:grameen_school/core/routes/app_routes.dart';

import 'package:grameen_school/modules/auth/pages/forgot_password_screen.dart';
import 'package:grameen_school/modules/auth/pages/login_screen.dart';
import 'package:grameen_school/modules/auth/pages/register_screen.dart';
import 'package:grameen_school/modules/auth/pages/reset_password_screen.dart';
import 'package:grameen_school/modules/auth/pages/verify_email_screen.dart';

import 'package:grameen_school/modules/courses/pages/courses_screen.dart';
import 'package:grameen_school/modules/home/pages/home_screen.dart';
import 'package:grameen_school/modules/learning/pages/learning_screen.dart';
import 'package:grameen_school/modules/meet/pages/meet_screen.dart';
import 'package:grameen_school/modules/onboarding/pages/onboarding_screen.dart';
import 'package:grameen_school/modules/profile/pages/profile_screen.dart';
import 'package:grameen_school/modules/splash/pages/splash_screen.dart';

abstract final class AppPages {
  static final routes = <GetPage>[
    // App Flow
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),

    // Authentication
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
    ),

    // Main Navigation
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.courses,
      page: () => const CoursesScreen(),
    ),
    GetPage(
      name: AppRoutes.meet,
      page: () => const MeetScreen(),
    ),
    GetPage(
      name: AppRoutes.learning,
      page: () => const LearningScreen(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),
  ];
}