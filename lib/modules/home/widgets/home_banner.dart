import 'dart:async';

import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  Timer? _timer;

  int _currentPage = 0;

  final List<_BannerData> _banners = const [
    _BannerData(
      title: 'Learn Anywhere',
      subtitle: 'Anytime',
      description: '',
      buttonText: 'Start Learning',
      image: 'assets/images/banners/banner_1.png',
      colors: [
        Color(0xFF4338CA),
        Color(0xFF2563EB),
        Color(0xFF06B6D4),
      ],
    ),
    _BannerData(
      title: 'Build Your Skills',
      subtitle: 'Grow Your Future',
      description: '',
      buttonText: 'Explore Courses',
      image: 'assets/images/banners/banner_2.png',
      colors: [
        Color(0xFF7C3AED),
        Color(0xFF9333EA),
        Color(0xFFEC4899),
      ],
    ),
    _BannerData(
      title: 'Learn & Achieve',
      subtitle: 'Your Goals',
      description: '',
      buttonText: 'Get Started',
      image: 'assets/images/banners/banner_3.png',
      colors: [
        Color(0xFF0F766E),
        Color(0xFF0891B2),
        Color(0xFF2563EB),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 4),
          (_) {
        if (!_pageController.hasClients) return;

        final nextPage = (_currentPage + 1) % _banners.length;

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 2.05,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _banners.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _BannerItem(
                  banner: _banners[index],
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Page Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
                (index) {
              final isActive = index == _currentPage;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF4338CA)
                      : const Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}

class _BannerItem extends StatelessWidget {
  const _BannerItem({
    required this.banner,
  });

  final _BannerData banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: banner.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                18,
                16,
                145,
                16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    banner.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    banner.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Flexible(
                    child: Text(
                      banner.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.35,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4338CA),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize:
                      MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      banner.buttonText,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Banner Image
          Positioned(
            right: -4,
            bottom: -8,
            child: IgnorePointer(
              child: Image.asset(
                banner.image,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerData {
  const _BannerData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.buttonText,
    required this.image,
    required this.colors,
  });

  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final String image;
  final List<Color> colors;
}