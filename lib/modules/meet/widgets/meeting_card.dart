import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    super.key,
    required this.month,
    required this.date,
    required this.day,
    required this.title,
    required this.time,
    required this.instructor,
    this.isLive = false,
    this.onJoin,
    this.onRemind,
  });

  final String month;
  final String date;
  final String day;
  final String title;
  final String time;
  final String instructor;

  final bool isLive;

  final VoidCallback? onJoin;
  final VoidCallback? onRemind;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ============================================================
          // DATE
          // ============================================================

          Container(
            width: 54,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 22,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ============================================================
          // MEETING INFO
          // ============================================================

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 7),

                // TIME
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: AppColors.textSecondary,
                    ),

                    const SizedBox(width: 4),

                    Flexible(
                      child: Text(
                        time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // INSTRUCTOR
                Row(
                  children: [
                    Container(
                      width: 21,
                      height: 21,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 12,
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Flexible(
                      child: Text(
                        instructor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ============================================================
          // ACTION BUTTON
          // ============================================================

          if (isLive)
            SizedBox(
              height: 34,
              child: ElevatedButton(
                onPressed: onJoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Text(
                  'Join Class',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 34,
              child: OutlinedButton(
                onPressed: onRemind,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide(
                    color: AppColors.primary.withOpacity(0.15),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications_none_rounded,
                      size: 14,
                    ),
                    SizedBox(width: 3),
                    Text(
                      'Remind Me',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}