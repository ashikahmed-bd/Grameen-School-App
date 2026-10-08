import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/widgets/app_bottom_navigation.dart';

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
              _buildTopBar(context),
              const SizedBox(height: 8),

              _buildProfileHeader(context),

              const SizedBox(height: 14),

              _buildSectionTitle('My Learning'),
              const SizedBox(height: 6),

              _buildMenuCard(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.menu_book_rounded,
                    iconColor: const Color(0xff9B6BFF),
                    iconBackground: const Color(0xffF1E9FF),
                    title: 'My Courses',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.bookmark_rounded,
                    iconColor: const Color(0xffF4B740),
                    iconBackground: const Color(0xffFFF4D8),
                    title: 'Saved Courses',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.workspace_premium_rounded,
                    iconColor: const Color(0xff35C98B),
                    iconBackground: const Color(0xffDFF9EE),
                    title: 'My Certificates',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
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

              _buildMenuCard(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.person_rounded,
                    iconColor: const Color(0xff4285F4),
                    iconBackground: const Color(0xffE8F1FF),
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.notifications_rounded,
                    iconColor: const Color(0xff9B6BFF),
                    iconBackground: const Color(0xffF0E9FF),
                    title: 'Notifications',
                    badge: '3',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.credit_card_rounded,
                    iconColor: const Color(0xff20B985),
                    iconBackground: const Color(0xffE0F8F0),
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.help_rounded,
                    iconColor: const Color(0xffF08A35),
                    iconBackground: const Color(0xffffeddc),
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
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

  // ---------------------------------------------------------------------------
  // TOP BAR
  // ---------------------------------------------------------------------------

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Profile',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5),
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


  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color(0xffEEEDFF),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/profile_bg.png',
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(),

          const SizedBox(height: 6),

          Text(
            'Rakibul Hasan',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            'rakibulhasan@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 9.5,
              fontWeight: FontWeight.w400,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE6DFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_rounded,
                  size: 11,
                  color: Color(0xff6B5AE8),
                ),
                SizedBox(width: 4),
                Text(
                  'Premium Learner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff6757D8),
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// AVATAR
  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 58,
          height: 58,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.png',
              width: 52,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xffE8E8F0),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 34,
                    color: Color(0xff777B87),
                  ),
                );
              },
            ),
          ),
        ),

        // Edit badge
        Positioned(
          right: -1,
          bottom: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff5B4FE9),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.edit_rounded,
              color: Colors.white,
              size: 9,
            ),
          ),
        ),
      ],
    );
  }
  // ---------------------------------------------------------------------------
  // SECTION TITLE
  // ---------------------------------------------------------------------------

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // MENU CARD
  // ---------------------------------------------------------------------------

  Widget _buildMenuCard({
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
        children: _addSeparators(children),
      ),
    );
  }

  List<Widget> _addSeparators(List<Widget> children) {
    final List<Widget> result = [];

    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);

      if (i != children.length - 1) {
        result.add(
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Divider(
              height: 1,
              thickness: .5,
              color: const Color(0xffF0F1F4),
            ),
          ),
        );
      }
    }

    return result;
  }

  // ---------------------------------------------------------------------------
  // LOGOUT
  // ---------------------------------------------------------------------------

  Widget _buildLogoutButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(11),
        onTap: () {},
        child: Ink(
          width: double.infinity,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xffffe4e5),
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout_rounded,
                size: 17,
                color: Color(0xffF0444F),
              ),
              SizedBox(width: 7),
              Text(
                'Log Out',
                style: TextStyle(
                  color: Color(0xffF0444F),
                  fontSize: 10.5,
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

// PROFILE MENU ITEM
class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 37,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackground,
                  ),
                  child: Icon(
                    icon,
                    size: 14,
                    color: iconColor,
                  ),
                ),

                const SizedBox(width: 9),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 9.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                if (badge != null) ...[
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 15,
                      minHeight: 15,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      color: Color(0xffF0444F),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 7.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],

                const Icon(
                  Icons.chevron_right_rounded,
                  size: 17,
                  color: Color(0xff9AA0AC),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}