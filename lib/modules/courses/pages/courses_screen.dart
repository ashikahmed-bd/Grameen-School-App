import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grameen_school/core/routes/app_routes.dart';
import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';
import 'package:grameen_school/modules/courses/widgets/course_list_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  static const List<String> categories = [
    'All',
    'Class 1-5',
    'Class 6-8',
    'Class 9-12',
    'College',
  ];

  static const List<CourseListData> courses = [
    CourseListData(
      title: 'Complete English Grammar for Beginners',
      image: 'assets/images/course_english.png',
      instructor: '',
      instructorImage: '',
      rating: '4.8',
      reviews: '1.2K',
      duration: '35 Lessons',
      price: '৳1,200',
      oldPrice: '৳1,500',
      discount: '20% OFF',
    ),

    CourseListData(
      title: 'Mathematics Mastery for Class 8',
      image: 'assets/images/course_math.png',
      instructor: '',
      instructorImage: '',
      rating: '4.9',
      reviews: '1.5K',
      duration: '42 Lessons',
      price: '৳1,000',
      oldPrice: '৳1,300',
      discount: '23% OFF',
    ),

    CourseListData(
      title: 'Science Fundamentals for Students',
      image: 'assets/images/course_science.png',
      instructor: '',
      instructorImage: '',
      rating: '4.8',
      reviews: '2.1K',
      duration: '50 Lessons',
      price: '৳1,500',
      oldPrice: '৳1,800',
      discount: '17% OFF',
    ),

    CourseListData(
      title: 'ICT & Digital Skills for Everyone',
      image: 'assets/images/course_ict.png',
      instructor: '',
      instructorImage: '',
      rating: '4.7',
      reviews: '1.1K',
      duration: '30 Lessons',
      price: '৳900',
      oldPrice: '৳1,200',
      discount: '25% OFF',
    ),

    CourseListData(
      title: 'Spoken English Mastery',
      image: 'assets/images/course_spoken_english.png',
      instructor: '',
      instructorImage: '',
      rating: '4.9',
      reviews: '1.8K',
      duration: '32 Lessons',
      price: '৳1,100',
      oldPrice: '৳1,400',
      discount: '21% OFF',
    ),

    CourseListData(
      title: 'Bangla Grammar & Writing Skills',
      image: 'assets/images/course_bangla.png',
      instructor: '',
      instructorImage: '',
      rating: '4.8',
      reviews: '950',
      duration: '28 Lessons',
      price: '৳800',
      oldPrice: '৳1,000',
      discount: '20% OFF',
    ),

    CourseListData(
      title: 'General Mathematics for Class 6-8',
      image: 'assets/images/course_general_math.png',
      instructor: '',
      instructorImage: '',
      rating: '4.8',
      reviews: '1.3K',
      duration: '45 Lessons',
      price: '৳1,200',
      oldPrice: '৳1,500',
      discount: '20% OFF',
    ),

    CourseListData(
      title: 'Physics Fundamentals for Beginners',
      image: 'assets/images/course_physics.png',
      instructor: '',
      instructorImage: '',
      rating: '4.7',
      reviews: '870',
      duration: '38 Lessons',
      price: '৳1,400',
      oldPrice: '৳1,700',
      discount: '18% OFF',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCategories(),

            const SizedBox(height: 4),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  10,
                  16,
                  20,
                ),
                itemCount: courses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final course = courses[index];

                  return CourseListCard(
                    course: course,
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.courseDetails,
                        arguments: course,
                      );
                    },
                    onFavorite: () {

                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        currentIndex: 1,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        12,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            borderRadius: BorderRadius.circular(20),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: Color(0xFF172554),
              ),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Text(
              'Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF172554),
              ),
            ),
          ),

          IconButton(
            onPressed: () {

            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            icon: const Icon(
              Icons.search_rounded,
              size: 25,
              color: Color(0xFF172554),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == 0;

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: selected
                  ? null
                  : Border.all(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: selected
                    ? Colors.white
                    : const Color(0xFF64748B),
              ),
            ),
          );
        },
      ),
    );
  }
}