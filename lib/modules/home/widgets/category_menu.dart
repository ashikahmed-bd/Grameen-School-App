import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      _CategoryItem(
        title: 'Development',
        icon: Icons.code_rounded,
        backgroundColor: const Color(0xFFEDEBFF),
        iconColor: const Color(0xFF4F46E5),
      ),
      _CategoryItem(
        title: 'Design',
        icon: Icons.palette_rounded,
        backgroundColor: const Color(0xFFFFEAF2),
        iconColor: const Color(0xFFEC4899),
      ),
      _CategoryItem(
        title: 'Business',
        icon: Icons.bar_chart_rounded,
        backgroundColor: const Color(0xFFFFF1DE),
        iconColor: const Color(0xFFF59E0B),
      ),
      _CategoryItem(
        title: 'Marketing',
        icon: Icons.campaign_rounded,
        backgroundColor: const Color(0xFFE5FBEF),
        iconColor: const Color(0xFF10B981),
      ),
      _CategoryItem(
        title: 'More',
        icon: Icons.apps_rounded,
        backgroundColor: const Color(0xFFF0F3F7),
        iconColor: const Color(0xFF64748B),
      ),
    ];

    return SizedBox(
      height: 116,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final category = categories[index];

          return _CategoryCard(
            item: category,
            onTap: () {
              // Category action
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.item,
    required this.onTap,
  });

  final _CategoryItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: item.backgroundColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                item.icon,
                size: 32,
                color: item.iconColor,
              ),
            ),

            const SizedBox(height: 9),

            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem {
  const _CategoryItem({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
}