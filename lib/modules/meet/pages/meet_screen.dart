import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';
import 'package:grameen_school/modules/meet/widgets/meeting_card.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                8,
              ),
              child: Row(
                children: [
                  _HeaderIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        'Live Classes',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),

                  // Keeps title perfectly centered.
                  const SizedBox(width: 38),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  top: 14,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _LiveClassBanner(),
                    ),

                    const SizedBox(height: 22),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'All Live Classes',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),

                          // VIEW ALL BUTTON
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    const _MeetingList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavigation(
        currentIndex: 2,
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.035),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 15,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _LiveClassBanner extends StatelessWidget {
  const _LiveClassBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -55,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.06),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 35,
            bottom: -40,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.04),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              14,
              14,
              8,
              10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // VIDEO ICON
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Icon(
                    Icons.videocam_rounded,
                    size: 21,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 10),

                // TEXT
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join Live Classes',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Attend interactive live classes with\n'
                            'instructors and get your doubts solved.',
                        style: TextStyle(
                          fontSize: 10,
                          height: 1.45,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 8),

                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 6,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Interactive learning',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // TEACHER ILLUSTRATION
                SizedBox(
                  width: 76,
                  height: 92,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 64,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      const Icon(
                        Icons.person_rounded,
                        size: 68,
                        color: AppColors.primary,
                      ),

                      Positioned(
                        top: 0,
                        right: 2,
                        child: Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.border,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.videocam_rounded,
                            size: 14,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
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

// MEETING LIST
class _MeetingList extends StatelessWidget {
  const _MeetingList();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          MeetingCard(
            month: 'OCT',
            date: '12',
            day: 'Sat',
            title: 'Introduction to Flutter',
            time: '10:00 AM - 11:30 AM',
            instructor: 'Rahim Uddin',
            isLive: true,
          ),

          SizedBox(height: 4),

          MeetingCard(
            month: 'OCT',
            date: '15',
            day: 'Tue',
            title: 'Setting up Development Environment',
            time: '10:00 AM - 11:30 AM',
            instructor: 'Rahim Uddin',
          ),

          SizedBox(height: 4),

          MeetingCard(
            month: 'OCT',
            date: '18',
            day: 'Fri',
            title: 'Your First Flutter App',
            time: '10:00 AM - 11:30 AM',
            instructor: 'Rahim Uddin',
          ),

          SizedBox(height: 4),

          MeetingCard(
            month: 'OCT',
            date: '22',
            day: 'Tue',
            title: 'Flutter Widgets Deep Dive',
            time: '10:00 AM - 11:30 AM',
            instructor: 'Taskin Ahmed',
          ),

          SizedBox(height: 4),

          MeetingCard(
            month: 'OCT',
            date: '25',
            day: 'Fri',
            title: 'State Management',
            time: '10:00 AM - 11:30 AM',
            instructor: 'Rahim Uddin',
          ),
        ],
      ),
    );
  }
}