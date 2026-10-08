import 'package:flutter/material.dart';
import 'package:grameen_school/core/routes/app_routes.dart';

import 'course_list_card.dart';

class TrendingCourses extends StatelessWidget {
  const TrendingCourses({
    super.key,
    this.onSeeAll,
  });

  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final courses = [
      const CourseListData(
        title: 'Python for Data Science and Machine Learning',
        image: 'assets/images/courses/python.jpg',
        instructor: 'Tanvir Ahmed',
        instructorImage: 'assets/images/users/tanvir.jpg',
        rating: '4.8',
        reviews: '1.5K reviews',
        duration: '10h 45m',
        price: '৳ 1,800',
        oldPrice: '৳ 2,800',
        discount: '36% OFF',
      ),
      const CourseListData(
        title: 'React JS Complete Course',
        image: 'assets/images/courses/react.jpg',
        instructor: 'Sadia Islam',
        instructorImage: 'assets/images/users/sadia.jpg',
        rating: '4.7',
        reviews: '980 reviews',
        duration: '14h 20m',
        price: '৳ 1,600',
        oldPrice: '৳ 2,600',
        discount: '38% OFF',
      ),
      const CourseListData(
        title: 'Digital Marketing Masterclass',
        image: 'assets/images/courses/marketing.jpg',
        instructor: 'Imran Hossain',
        instructorImage: 'assets/images/users/imran.jpg',
        rating: '4.6',
        reviews: '720 reviews',
        duration: '8h 10m',
        price: '৳ 1,200',
        oldPrice: '৳ 2,000',
        discount: '30% OFF',
      ),
      const CourseListData(
        title: 'Complete Flutter App Development',
        image: 'assets/images/courses/flutter.jpg',
        instructor: 'Rahim Uddin',
        instructorImage: 'assets/images/users/rahim.jpg',
        rating: '4.9',
        reviews: '1.8K reviews',
        duration: '16h 30m',
        price: '৳ 2,000',
        oldPrice: '৳ 3,000',
        discount: '33% OFF',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'All Courses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),

              TextButton(
                onPressed: onSeeAll,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6D28D9),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            separatorBuilder: (_, __) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              final course = courses[index];

              return CourseListCard(
                course: course,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.courseDetails,
                    arguments: course,
                  );
                },
                onFavorite: () {
                  // Add/remove favorite
                },
              );
            },
          ),
        ),
      ],
    );
  }
}