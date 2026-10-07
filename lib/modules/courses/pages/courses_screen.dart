import 'package:flutter/material.dart';
import 'package:grameen_school/core/routes/app_routes.dart';

import 'package:get/get.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  static const categories = [
    'All',
    'Class 1-5',
    'Class 6-8',
    'Class 9-12',
    'College',
  ];

  static const courses = [
    (
    title: 'Complete English Grammar for Beginners',
    instructor: 'Dr. Farhana Islam',
    rating: '4.8',
    reviews: '1.2K',
    lessons: '35 Lessons',
    price: '৳1,200',
    image: 'assets/images/course_english.png',
    ),
    (
    title: 'Mathematics for Class 8',
    instructor: 'Md. Hasan Sir',
    rating: '4.7',
    reviews: '980',
    lessons: '40 Lessons',
    price: '৳1,000',
    image: 'assets/images/course_math.png',
    ),
    (
    title: 'Science Fundamentals',
    instructor: 'Dr. Nusrat Jahan',
    rating: '4.8',
    reviews: '2.1K',
    lessons: '50 Lessons',
    price: '৳1,500',
    image: 'assets/images/course_science.png',
    ),
    (
    title: 'ICT for Everyone',
    instructor: 'Tanvir Ahmed',
    rating: '4.6',
    reviews: '840',
    lessons: '28 Lessons',
    price: '৳900',
    image: 'assets/images/course_ict.png',
    ),
    (
    title: 'Spoken English Mastery',
    instructor: 'Sadia Rahman',
    rating: '4.9',
    reviews: '1.8K',
    lessons: '32 Lessons',
    price: '৳1,100',
    image: 'assets/images/course_spoken_english.png',
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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  14,
                  16,
                  20,
                ),
                itemCount: courses.length,
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _CourseCard(
                    course: courses[index],
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
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_rounded,
            size: 24,
            color: Color(0xFF172554),
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
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
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

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.course,
  });

  final ({
  String title,
  String instructor,
  String rating,
  String reviews,
  String lessons,
  String price,
  String image,
  }) course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.toNamed(
          AppRoutes.courseDetails,
          arguments: course,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              course.image,
              width: 92,
              height: 92,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  width: 92,
                  height: 92,
                  color: const Color(0xFFE2E8F0),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    color: Color(0xFF94A3B8),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          color: Color(0xFF172554),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.favorite_border_rounded,
                      size: 23,
                      color: Color(0xFFEF6B7A),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  course.instructor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 17,
                      color: Color(0xFFFBBF24),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      course.rating,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(${course.reviews})',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      course.lessons,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    course.price,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4338CA),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}