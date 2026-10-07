import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';
import 'package:grameen_school/modules/home/widgets/category_menu.dart';
import 'package:grameen_school/modules/home/widgets/home_header.dart';
import 'package:grameen_school/modules/home/widgets/home_banner.dart';
import 'package:grameen_school/modules/home/widgets/recommended_course_slider.dart';
import 'package:grameen_school/modules/home/widgets/top_instructors.dart';
import 'package:grameen_school/modules/home/widgets/trending_courses.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),

            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 4),
                child: Column(
                  children: [
                    HomeBanner(),

                    SizedBox(height: 16),

                    CategoryMenu(),

                    SizedBox(height: 16),

                    RecommendedCourseSlider(),

                    SizedBox(height: 16),

                    TopInstructors(),

                    SizedBox(height: 16),

                    TrendingCourses()

                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}