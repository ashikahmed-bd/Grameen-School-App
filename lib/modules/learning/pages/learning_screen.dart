import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';
import 'package:grameen_school/modules/learning/widgets/learning_card.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ---------------------------------------------------------------
            // STICKY HEADER
            // ---------------------------------------------------------------
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(
                child: Container(
                  color: AppColors.background,
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    12,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'My Courses',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            height: 1,
                          ),
                        ),
                      ),

                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // See all courses
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 2,
                          ),
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ---------------------------------------------------------------
            // FILTER
            // ---------------------------------------------------------------
            const SliverToBoxAdapter(
              child: SizedBox(height: 2),
            ),

            const SliverToBoxAdapter(
              child: _CourseFilter(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 14),
            ),

            // ---------------------------------------------------------------
            // COURSES
            // ---------------------------------------------------------------
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final course = courses[index];

                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      index == 0 ? 0 : 7,
                      16,
                      7,
                    ),
                    child: LearningCard(
                      title: course.title,
                      category: course.category,
                      image: course.image,
                      completedLessons: course.completedLessons,
                      totalLessons: course.totalLessons,
                      progress: course.progress,
                      onTap: () {
                        // Open course details
                      },
                    ),
                  );
                },
                childCount: courses.length,
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),

      // ---------------------------------------------------------------
      // BOTTOM NAVIGATION
      // ---------------------------------------------------------------
      bottomNavigationBar: const BottomNavigation(
        currentIndex: 3,
      ),
    );
  }
}

// =============================================================================
// STICKY HEADER DELEGATE
// =============================================================================

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _StickyHeaderDelegate({
    required this.child,
  });

  final Widget child;

  static const double _height = 44;

  @override
  double get minExtent => _height;

  @override
  double get maxExtent => _height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Material(
      color: AppColors.background,
      child: child,
    );
  }

  @override
  bool shouldRebuild(
      covariant _StickyHeaderDelegate oldDelegate,
      ) {
    return oldDelegate.child != child;
  }
}

// =============================================================================
// COURSE FILTER
// =============================================================================

class _CourseFilter extends StatelessWidget {
  const _CourseFilter();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          _FilterChip(
            title: 'All',
            selected: true,
          ),
          _FilterChip(
            title: 'In Progress',
          ),
          _FilterChip(
            title: 'Completed',
          ),
          _FilterChip(
            title: 'Not Started',
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// FILTER CHIP
// =============================================================================

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.title,
    this.selected = false,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primary
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? AppColors.primary
              : const Color(0xFFE5E7EB),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected
              ? Colors.white
              : AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// =============================================================================
// COURSE DATA
// =============================================================================

class CourseData {
  const CourseData({
    required this.title,
    required this.category,
    required this.image,
    required this.completedLessons,
    required this.totalLessons,
    required this.progress,
  });

  final String title;
  final String category;
  final String image;
  final int completedLessons;
  final int totalLessons;
  final double progress;
}

const List<CourseData> courses = [
  CourseData(
    title: 'Complete English Grammar for Beginners',
    category: 'English',
    image: 'assets/images/course_english.png',
    completedLessons: 24,
    totalLessons: 35,
    progress: 0.68,
  ),
  CourseData(
    title: 'Flutter App Development Masterclass',
    category: 'Programming',
    image: 'assets/images/course_flutter.png',
    completedLessons: 18,
    totalLessons: 40,
    progress: 0.45,
  ),
  CourseData(
    title: 'Digital Marketing Complete Course',
    category: 'Marketing',
    image: 'assets/images/course_marketing.png',
    completedLessons: 12,
    totalLessons: 30,
    progress: 0.40,
  ),
  CourseData(
    title: 'Graphic Design with Canva',
    category: 'Design',
    image: 'assets/images/course_design.png',
    completedLessons: 30,
    totalLessons: 30,
    progress: 1.0,
  ),
];