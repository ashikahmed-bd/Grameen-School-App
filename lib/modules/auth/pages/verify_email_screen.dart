import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text('Verify Email'),
      ),
    );
  }
}