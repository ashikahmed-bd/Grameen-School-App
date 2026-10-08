import 'package:flutter/material.dart';

import 'package:grameen_school/core/theme/app_colors.dart';
import 'package:grameen_school/core/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
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
        children: [
          _ProfileAvatar(),

          const SizedBox(height: 5),

          Text(
            'Rakibul Hasan',
            textAlign: TextAlign.center,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            'rakibulhasan@gmail.com',
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffE6DFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.school_rounded,
                  size: 11,
                  color: Color(0xff6B5AE8),
                ),
                const SizedBox(width: 4),
                Text(
                  'Premium Learner',
                  style: AppTextStyles.small.copyWith(
                    color: const Color(0xff6757D8),
                    fontWeight: FontWeight.w600,
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

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 66,
          height: 66,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
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
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (
                  context,
                  error,
                  stackTrace,
                  ) {
                return const ColoredBox(
                  color: Color(0xffE8E8F0),
                  child: Icon(
                    Icons.person_rounded,
                    size: 38,
                    color: Color(0xff777B87),
                  ),
                );
              },
            ),
          ),
        ),

        Positioned(
          right: -1,
          bottom: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
              border: Border.all(
                color: AppColors.white,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.edit_rounded,
              color: AppColors.white,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }
}