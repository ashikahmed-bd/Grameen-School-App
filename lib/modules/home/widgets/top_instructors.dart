import 'package:flutter/material.dart';

class TopInstructors extends StatelessWidget {
  const TopInstructors({
    super.key,
    this.onSeeAll,
  });

  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final instructors = [
      const InstructorData(
        name: 'Rahim Uddin',
        role: 'Mobile Developer',
        image: 'assets/images/users/rahim.jpg',
      ),
      const InstructorData(
        name: 'Nusrat Jahan',
        role: 'UI/UX Designer',
        image: 'assets/images/users/nusrat.jpg',
      ),
      const InstructorData(
        name: 'Tanvir Ahmed',
        role: 'Web Developer',
        image: 'assets/images/users/tanvir.jpg',
      ),
      const InstructorData(
        name: 'Sadia Islam',
        role: 'Data Scientist',
        image: 'assets/images/users/sadia.jpg',
      ),
      const InstructorData(
        name: 'Nusrat Jahan',
        role: 'UI/UX Designer',
        image: 'assets/images/users/nusrat.jpg',
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
                  'Top Instructors',
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
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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


        LayoutBuilder(
          builder: (context, constraints) {
            const horizontalPadding = 32.0;
            const itemGap = 12.0;

            final itemWidth =
                (constraints.maxWidth -
                    horizontalPadding -
                    (itemGap * 3)) /
                    4;

            return SizedBox(
              height: itemWidth + 65,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount: instructors.length,
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    width: itemGap,
                  );
                },
                itemBuilder: (context, index) {
                  final instructor = instructors[index];

                  return SizedBox(
                    width: itemWidth,
                    child: InstructorItem(
                      instructor: instructor,
                      onTap: () {
                        // Open instructor profile
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

// ============================================================
// Instructor Item
// ============================================================

class InstructorItem extends StatelessWidget {
  const InstructorItem({
    super.key,
    required this.instructor,
    this.onTap,
  });

  final InstructorData instructor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          // --------------------------------------------------
          // Profile Image
          // --------------------------------------------------
          AspectRatio(
            aspectRatio: 1,
            child: ClipOval(
              child: Image.asset(
                instructor.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: const Color(0xFFE2E8F0),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 36,
                      color: Color(0xFF94A3B8),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // --------------------------------------------------
          // Name
          // --------------------------------------------------
          Text(
            instructor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),

          const SizedBox(height: 2),

          // --------------------------------------------------
          // Role
          // --------------------------------------------------
          Text(
            instructor.role,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Instructor Data
// ============================================================

class InstructorData {
  const InstructorData({
    required this.name,
    required this.role,
    required this.image,
  });

  final String name;
  final String role;
  final String image;
}