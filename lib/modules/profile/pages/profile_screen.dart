import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/theme/app_text_styles.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';
import 'package:grameen_school/modules/profile/widgets/profile_header.dart';
import 'package:grameen_school/modules/profile/widgets/profile_menu_card.dart';
import 'package:grameen_school/modules/profile/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),

              const SizedBox(height: 8),

              const ProfileHeader(),

              const SizedBox(height: 14),

              _buildSectionTitle('My Learning'),

              const SizedBox(height: 6),

              ProfileMenuCard(
                children: [
                  ProfileMenuItem(
                    icon: Icons.menu_book_rounded,
                    iconColor: const Color(0xff9B6BFF),
                    iconBackground: const Color(0xffF1E9FF),
                    title: 'My Courses',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.bookmark_rounded,
                    iconColor: const Color(0xffF4B740),
                    iconBackground: const Color(0xffFFF4D8),
                    title: 'Saved Courses',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.workspace_premium_rounded,
                    iconColor: const Color(0xff35C98B),
                    iconBackground: const Color(0xffDFF9EE),
                    title: 'My Certificates',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.favorite_rounded,
                    iconColor: const Color(0xffF15B6C),
                    iconBackground: const Color(0xffffe5e9),
                    title: 'My Wishlist',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 14),

              _buildSectionTitle('Account'),

              const SizedBox(height: 6),

              ProfileMenuCard(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_rounded,
                    iconColor: const Color(0xff4285F4),
                    iconBackground: const Color(0xffE8F1FF),
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.notifications_rounded,
                    iconColor: const Color(0xff9B6BFF),
                    iconBackground: const Color(0xffF0E9FF),
                    title: 'Notifications',
                    badge: '3',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.credit_card_rounded,
                    iconColor: const Color(0xff20B985),
                    iconBackground: const Color(0xffE0F8F0),
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.help_rounded,
                    iconColor: const Color(0xffF08A35),
                    iconBackground: const Color(0xffffeddc),
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings_rounded,
                    iconColor: const Color(0xff727B8C),
                    iconBackground: const Color(0xffECEEF2),
                    title: 'Settings',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 14),

              _buildLogoutButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        currentIndex: 4,
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Profile',
            style: AppTextStyles.title,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.settings_outlined,
                size: 21,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(11),
        onTap: () {},
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffffe4e5),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout_rounded,
                size: 18,
                color: AppColors.error,
              ),
              const SizedBox(width: 8),
              Text(
                'Log Out',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}