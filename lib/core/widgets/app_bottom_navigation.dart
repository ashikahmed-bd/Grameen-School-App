import 'package:flutter/material.dart';
import 'package:grameen_school/core/routes/app_routes.dart';
import 'package:grameen_school/core/theme/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  static const List<String> _routes = [
    AppRoutes.home,
    AppRoutes.courses,
    AppRoutes.meet,
    AppRoutes.learning,
    AppRoutes.profile,
  ];

  static const List<String> _labels = [
    'Home',
    'Courses',
    'Meet',
    'Learning',
    'Profile',
  ];

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.menu_book_outlined,
    Icons.video_call_outlined,
    Icons.play_circle_outline_rounded,
    Icons.person_outline_rounded,
  ];

  static const List<IconData> _selectedIcons = [
    Icons.home_rounded,
    Icons.menu_book_rounded,
    Icons.video_call_rounded,
    Icons.play_circle_rounded,
    Icons.person_rounded,
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: List.generate(
          _routes.length,
              (index) => Expanded(
            child: _buildNavItem(
              context: context,
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
  }) {
    final bool isSelected = currentIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (index == currentIndex) return;

          Navigator.pushReplacementNamed(
            context,
            _routes[index],
          );
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: SizedBox(
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isSelected
                      ? _selectedIcons[index]
                      : _icons[index],
                  size: 22,
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _labels[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  height: 1.0,
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}