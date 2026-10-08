import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';

class LearningCard extends StatelessWidget {
  const LearningCard({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.completedLessons,
    required this.totalLessons,
    required this.progress,
    this.onTap,
  });

  final String title;
  final String category;
  final String image;
  final int completedLessons;
  final int totalLessons;
  final double progress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final percentage = (progress.clamp(0.0, 1.0) * 100).round();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFE8EAF0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CourseImage(
                image: image,
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Row(
                      children: [
                        Icon(
                          Icons.play_circle_outline_rounded,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '$completedLessons/$totalLessons Lessons',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progress.clamp(0.0, 1.0),
                              minHeight: 5,
                              backgroundColor: const Color(0xFFEDEEF2),
                              valueColor:
                              AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          '$percentage%',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseImage extends StatelessWidget {
  const _CourseImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Image.asset(
        image,
        width: 88,
        height: 88,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              Icons.school_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}