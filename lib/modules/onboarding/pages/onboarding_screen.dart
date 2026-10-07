import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grameen_school/core/routes/app_routes.dart';
import 'package:grameen_school/core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 140,
                  height: 92,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 2),

                const Text(
                  'Grameen School',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                    color: Color(0xFF172554),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Learn Today • Build a Better Tomorrow',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Image.asset(
                'assets/images/onboarding.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Quality Education for a Brighter Future',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF6B7280),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}