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

  // ============================================================
  // BANNER IMAGES
  // ============================================================

  final List<String> _banners = const [
    'assets/images/banners/1.png',
    'assets/images/banners/2.png',
    'assets/images/banners/3.png',
  ];

  @override
  void initState() {
    super.initState();

    _startAutoSlide();
  }


  void _startAutoSlide() {
    _timer = Timer.periodic(
      const Duration(seconds: 4),
          (_) {
        if (!_pageController.hasClients || _banners.isEmpty) {
          return;
        }

        final int nextPage =
            (_currentPage + 1) % _banners.length;

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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 2.4,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _banners.length,

              onPageChanged: (index) {
                if (!mounted) return;

                setState(() {
                  _currentPage = index;
                });
              },

              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,

                  margin: const EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    8,
                  ),

                  clipBehavior: Clip.antiAlias,

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Image.asset(
                    _banners[index],

                    width: double.infinity,
                    height: double.infinity,

                    // Full banner fill
                    fit: BoxFit.cover,

                    alignment: Alignment.center,

                    errorBuilder: (
                        context,
                        error,
                        stackTrace,
                        ) {
                      debugPrint(
                        'Banner image error: $error',
                      );

                      return const ColoredBox(
                        color: Colors.black,
                        child: Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: Colors.white54,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 4),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
                (index) {
              final bool isActive =
                  index == _currentPage;

              return AnimatedContainer(
                duration: const Duration(
                  milliseconds: 250,
                ),

                margin: const EdgeInsets.symmetric(
                  horizontal: 3,
                ),

                width: isActive ? 18 : 6,
                height: 6,

                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF4338CA)
                      : const Color(0xFFD1D5DB),

                  borderRadius:
                  BorderRadius.circular(10),
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