import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grameen_school/core/theme/app_colors.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  // ===========================================================================
  // DUMMY COURSE DATA
  // ===========================================================================

  static const String courseTitle =
      'Complete English Grammar for Beginners';

  static const String instructor = 'Dr. Farhana Islam';

  static const String category = 'English';

  static const String courseImage =
      'assets/images/course_english.png';

  static const String rating = '4.8';

  static const String reviews = '1.2K';

  static const String totalLessons = '35 Lessons';

  static const String price = '৳1,200';

  static const String oldPrice = '৳1,500';

  static const String discount = '20% OFF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // =============================================================
                // HEADER + HERO
                // =============================================================

                const SliverToBoxAdapter(
                  child: _CourseHeader(),
                ),

                // =============================================================
                // COURSE INFORMATION
                // =============================================================

                const SliverToBoxAdapter(
                  child: _CourseInfo(),
                ),

                // =============================================================
                // TABS
                // =============================================================

                const SliverToBoxAdapter(
                  child: _CourseTabs(),
                ),

                // =============================================================
                // CURRICULUM
                // =============================================================

                const SliverToBoxAdapter(
                  child: _CurriculumSection(),
                ),

                // Bottom space for fixed button
                const SliverToBoxAdapter(
                  child: SizedBox(height: 105),
                ),
              ],
            ),

            // ===============================================================
            // FIXED ENROLL BUTTON
            // ===============================================================

            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _EnrollBottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// HEADER + HERO
// =============================================================================

class _CourseHeader extends StatelessWidget {
  const _CourseHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------------------------------------------------------------
        // TOP HEADER BAR
        // ---------------------------------------------------------------------

        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.white,
          child: Row(
            children: [
              // Back
              _HeaderButton(
                icon: Icons.arrow_back_rounded,
                onTap: () => Get.back(),
              ),

              const SizedBox(width: 11),

              // Header title
              Expanded(
                child: Text(
                  'Course Details',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ),

              // Heart
              _HeaderButton(
                icon: Icons.favorite_border_rounded,
                onTap: () {},
              ),

              const SizedBox(width: 8),

              // Share
              _HeaderButton(
                icon: Icons.share_rounded,
                onTap: () {},
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------------------
        // HERO IMAGE
        // ---------------------------------------------------------------------

        SizedBox(
          height: 205,
          child: Stack(
            children: [
              // Image
              Positioned.fill(
                child: Image.asset(
                  CourseDetailsScreen.courseImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: AppColors.primary.withOpacity(0.08),
                      child: Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.primary,
                        size: 58,
                      ),
                    );
                  },
                ),
              ),

              // Bottom gradient
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.18),
                      ],
                    ),
                  ),
                ),
              ),

              // Play button
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// HEADER BUTTON
// =============================================================================

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11),
        child: Ink(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F6FA),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: const Color(0xFFE8EAF0),
              width: 0.8,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.textPrimary,
            size: 18,
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// COURSE INFO
// =============================================================================

class _CourseInfo extends StatelessWidget {
  const _CourseInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------------------------------------------------------------------
          // CATEGORY
          // -------------------------------------------------------------------

          Text(
            CourseDetailsScreen.category.toUpperCase(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),

          const SizedBox(height: 6),

          // -------------------------------------------------------------------
          // TITLE
          // -------------------------------------------------------------------

          Text(
            CourseDetailsScreen.courseTitle,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w800,
              height: 1.22,
              letterSpacing: -0.2,
            ),
          ),

          const SizedBox(height: 11),

          // -------------------------------------------------------------------
          // INSTRUCTOR
          // -------------------------------------------------------------------

          Row(
            children: [
              Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: AppColors.primary,
                  size: 17,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                CourseDetailsScreen.instructor,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // -------------------------------------------------------------------
          // RATING + LESSONS
          // -------------------------------------------------------------------

          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB800),
                size: 16,
              ),

              const SizedBox(width: 3),

              Text(
                CourseDetailsScreen.rating,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Text(
                ' (${CourseDetailsScreen.reviews})',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Container(
                width: 1,
                height: 13,
                margin: const EdgeInsets.symmetric(
                  horizontal: 11,
                ),
                color: const Color(0xFFE3E5EA),
              ),

              Icon(
                Icons.play_circle_outline_rounded,
                color: AppColors.textSecondary,
                size: 15,
              ),

              const SizedBox(width: 4),

              Text(
                CourseDetailsScreen.totalLessons,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          // -------------------------------------------------------------------
          // PRICE
          // -------------------------------------------------------------------

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                CourseDetailsScreen.price,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(width: 9),

              Text(
                CourseDetailsScreen.oldPrice,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough,
                ),
              ),

              const SizedBox(width: 9),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F8EF),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  CourseDetailsScreen.discount,
                  style: TextStyle(
                    color: Color(0xFF159957),
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// TABS
// =============================================================================

class _CourseTabs extends StatelessWidget {
  const _CourseTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.white,
      child: Row(
        children: const [
          _TabItem(
            title: 'Overview',
            selected: false,
          ),
          _TabItem(
            title: 'Curriculum',
            selected: true,
          ),
          _TabItem(
            title: 'Reviews',
            selected: false,
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// TAB ITEM
// =============================================================================

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.title,
    required this.selected,
  });

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: selected
                  ? AppColors.primary
                  : AppColors.textSecondary,
              fontSize: 10,
              fontWeight: selected
                  ? FontWeight.w800
                  : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CURRICULUM SECTION
// =============================================================================

class _CurriculumSection extends StatelessWidget {
  const _CurriculumSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(
        16,
        17,
        16,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------------------------------------------------------------------
          // TITLE
          // -------------------------------------------------------------------

          Row(
            children: [
              Expanded(
                child: Text(
                  'Course Curriculum',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Text(
                '35 Lessons',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          // -------------------------------------------------------------------
          // MODULE
          // -------------------------------------------------------------------

          const _CourseModule(),
        ],
      ),
    );
  }
}

// =============================================================================
// COURSE MODULE
// =============================================================================

class _CourseModule extends StatelessWidget {
  const _CourseModule();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EAF0),
        ),
      ),
      child: Column(
        children: [
          // -------------------------------------------------------------------
          // MODULE HEADER
          // -------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(
              13,
              12,
              13,
              10,
            ),
            child: Row(
              children: [
                Container(
                  width: 31,
                  height: 31,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(
                    Icons.menu_book_rounded,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Module 1: Introduction',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        '4 Lessons • 1h 20m',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            color: Color(0xFFEDEEF2),
          ),

          // -------------------------------------------------------------------
          // LESSON 1
          // -------------------------------------------------------------------

          const _LessonItem(
            number: '01',
            title: 'Welcome to the Course',
            duration: '12:30',
          ),

          // -------------------------------------------------------------------
          // LESSON 2
          // -------------------------------------------------------------------

          const _LessonItem(
            number: '02',
            title: 'What is Grammar?',
            duration: '15:20',
          ),

          // -------------------------------------------------------------------
          // LESSON 3
          // -------------------------------------------------------------------

          const _LessonItem(
            number: '03',
            title: 'Parts of Speech',
            locked: true,
          ),

          // -------------------------------------------------------------------
          // LESSON 4
          // -------------------------------------------------------------------

          const _LessonItem(
            number: '04',
            title: 'Practice Exercise',
            duration: '25:10',
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// LESSON ITEM
// =============================================================================

class _LessonItem extends StatelessWidget {
  const _LessonItem({
    required this.number,
    required this.title,
    this.duration,
    this.locked = false,
  });

  final String number;
  final String title;
  final String? duration;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: locked ? null : () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
          ),
          child: Row(
            children: [
              // Lesson icon
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: locked
                      ? const Color(0xFFF2F3F6)
                      : AppColors.primary.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: locked
                    ? Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.textSecondary,
                  size: 12,
                )
                    : Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.primary,
                  size: 14,
                ),
              ),

              const SizedBox(width: 9),

              // Number
              SizedBox(
                width: 20,
                child: Text(
                  number,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Title
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: locked
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Duration
              if (duration != null)
                Text(
                  duration!,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              // Lock
              if (locked) ...[
                const SizedBox(width: 5),
                Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.textSecondary,
                  size: 13,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// ENROLL BOTTOM BAR
// =============================================================================

class _EnrollBottomBar extends StatelessWidget {
  const _EnrollBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        9,
        16,
        12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          child: const Text(
            'Enroll Now',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}