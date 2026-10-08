import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'profile_menu_item.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.025),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: _buildItemsWithDivider(),
      ),
    );
  }

  List<Widget> _buildItemsWithDivider() {
    final List<Widget> items = [];

    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);

      if (i < children.length - 1) {
        items.add(
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(
              height: 1,
              thickness: .5,
              color: AppColors.border,
            ),
          ),
        );
      }
    }

    return items;
  }
}