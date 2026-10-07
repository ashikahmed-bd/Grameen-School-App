import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text('Meet'),
      ),
      bottomNavigationBar: const BottomNavigation(
        currentIndex: 2,
      ),
    );
  }
}