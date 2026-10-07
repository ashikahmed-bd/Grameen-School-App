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

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 68,
        backgroundColor: Colors.white,
        elevation: 0,

        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
              (states) {
            final selected = states.contains(WidgetState.selected);

            return TextStyle(
              fontSize: 11,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              color: selected
                  ? AppColors.primary
                  : Colors.grey.shade600,
            );
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
              (states) {
            final selected = states.contains(WidgetState.selected);

            return IconThemeData(
              size: 22,
              color: selected
                  ? AppColors.primary
                  : Colors.grey.shade600,
            );
          },
        ),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          if (index == currentIndex) {
            return;
          }

          Navigator.pushReplacementNamed(
            context,
            _routes[index],
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.video_call_outlined),
            selectedIcon: Icon(Icons.video_call_rounded),
            label: 'Meet',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline_rounded),
            selectedIcon: Icon(Icons.play_circle_rounded),
            label: 'Learning',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}