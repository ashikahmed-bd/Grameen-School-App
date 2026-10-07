import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER
            // ============================================================

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

            // ============================================================
            // TABS
            // ============================================================

            const _MeetTabs(),

            // ============================================================
            // BODY
            // ============================================================

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
                    // ======================================================
                    // LIVE CLASS BANNER
                    // ======================================================

                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: _LiveClassBanner(),
                    ),

                    const SizedBox(height: 22),

                    // ======================================================
                    // COURSE HEADER
                    // ======================================================

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Flutter Complete Course',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),

                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: AppColors.border,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ======================================================
                    // CLASS LIST
                    // ======================================================

                    const _ClassList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ================================================================
      // BOTTOM NAVIGATION
      // ================================================================

      bottomNavigationBar: const BottomNavigation(
        currentIndex: 2,
      ),
    );
  }
}

// ========================================================================
// HEADER ICON BUTTON
// ========================================================================

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _HeaderIconButton({
    required this.icon,
    this.onTap,
  });

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

// ========================================================================
// TABS
// ========================================================================

class _MeetTabs extends StatelessWidget {
  const _MeetTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: _TabItem(
              title: 'Upcoming',
              selected: true,
            ),
          ),
          Expanded(
            child: _TabItem(
              title: 'Previous',
              selected: false,
            ),
          ),
          Expanded(
            child: _TabItem(
              title: 'Recordings',
              selected: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;

  const _TabItem({
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: selected
                  ? AppColors.primary
                  : AppColors.textPrimary,
            ),
          ),
        ),

        if (selected)
          Container(
            height: 2.5,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
      ],
    );
  }
}

// ========================================================================
// LIVE CLASS BANNER
// ========================================================================

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
          // ==============================================================
          // DECORATIVE CIRCLE
          // ==============================================================

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

          // ==============================================================
          // CONTENT
          // ==============================================================

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
                // ========================================================
                // VIDEO ICON
                // ========================================================

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

                // ========================================================
                // TEXT
                // ========================================================

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

                // ========================================================
                // TEACHER ILLUSTRATION
                // ========================================================

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

// ========================================================================
// CLASS LIST
// ========================================================================

class _ClassList extends StatelessWidget {
  const _ClassList();

  @override
  Widget build(BuildContext context) {
    final classes = [
      const _ClassData(
        month: 'OCT',
        date: '12',
        day: 'Sat',
        title: 'Introduction to Flutter',
        time: '10:00 AM - 11:30 AM',
        instructor: 'Rahim Uddin',
        join: true,
      ),
      const _ClassData(
        month: 'OCT',
        date: '15',
        day: 'Tue',
        title: 'Setting up Development Environment',
        time: '10:00 AM - 11:30 AM',
        instructor: 'Rahim Uddin',
      ),
      const _ClassData(
        month: 'OCT',
        date: '18',
        day: 'Fri',
        title: 'Your First Flutter App',
        time: '10:00 AM - 11:30 AM',
        instructor: 'Rahim Uddin',
      ),
      const _ClassData(
        month: 'OCT',
        date: '22',
        day: 'Tue',
        title: 'Flutter Widgets Deep Dive',
        time: '10:00 AM - 11:30 AM',
        instructor: 'Taskin Ahmed',
      ),
      const _ClassData(
        month: 'OCT',
        date: '25',
        day: 'Fri',
        title: 'State Management',
        time: '10:00 AM - 11:30 AM',
        instructor: 'Rahim Uddin',
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemCount: classes.length,
      separatorBuilder: (_, __) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return _ClassCard(
          data: classes[index],
        );
      },
    );
  }
}

// ========================================================================
// CLASS CARD
// ========================================================================

class _ClassCard extends StatelessWidget {
  final _ClassData data;

  const _ClassCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 9,
      ),
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
          // ==============================================================
          // DATE
          // ==============================================================

          Container(
            width: 46,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.month,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  data.date,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  data.day,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 11),

          // ==============================================================
          // CLASS INFO
          // ==============================================================

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 5),

                // Time
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),

                    const SizedBox(width: 4),

                    Flexible(
                      child: Text(
                        data.time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Instructor
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
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
                        data.instructor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 9,
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

          const SizedBox(width: 7),

          // ==============================================================
          // ACTION
          // ==============================================================

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.more_vert_rounded,
                size: 18,
                color: AppColors.textSecondary,
              ),

              const SizedBox(height: 7),

              if (data.join)
              // --------------------------------------------------------
              // JOIN CLASS
              // --------------------------------------------------------
                Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.18),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Join Class',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                )
              else
              // --------------------------------------------------------
              // REMIND ME
              // --------------------------------------------------------
                Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.12),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications_none_rounded,
                        size: 14,
                        color: AppColors.primary,
                      ),

                      SizedBox(width: 3),

                      Text(
                        'Remind Me',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ========================================================================
// CLASS DATA
// ========================================================================

class _ClassData {
  final String month;
  final String date;
  final String day;
  final String title;
  final String time;
  final String instructor;
  final bool join;

  const _ClassData({
    required this.month,
    required this.date,
    required this.day,
    required this.title,
    required this.time,
    required this.instructor,
    this.join = false,
  });
}