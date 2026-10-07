import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grameen_school/core/routes/app_routes.dart';
import 'package:grameen_school/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
          () {
        if (!mounted) {
          return;
        }

        Get.offNamed(AppRoutes.onboarding);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(),

              // Logo
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Grameen School',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.6,
                  color: Color(0xFF172554),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Learn Today • Build a Better Tomorrow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: AppColors.primary,
                ),
              ),

              const Spacer(),

              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Quality Education for a Brighter Future',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}