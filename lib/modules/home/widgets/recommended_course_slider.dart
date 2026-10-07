import 'package:flutter/material.dart';

class RecommendedCourseSlider extends StatelessWidget {
  const RecommendedCourseSlider({
    super.key,
    this.onSeeAll,
  });

  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final courses = [
      const CourseModel(
        title: 'Flutter Complete Course for Beginners to Advanced',
        image:
        'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=800',
        rating: 4.8,
        reviews: '1.2K reviews',
        duration: '12h 30m',
        price: 1500,
        oldPrice: 2500,
        discount: '40% OFF',
        bestseller: true,
      ),
      const CourseModel(
        title: 'UI/UX Design Masterclass for Beginners',
        image:
        'https://images.unsplash.com/photo-1558655146-d09347e92766?w=800',
        rating: 4.7,
        reviews: '856 reviews',
        duration: '8h 20m',
        price: 1200,
        oldPrice: 2000,
        discount: '40% OFF',
        bestseller: false,
      ),
      const CourseModel(
        title: 'Complete Web Development Course',
        image:
        'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800',
        rating: 4.9,
        reviews: '2.1K reviews',
        duration: '15h 40m',
        price: 1800,
        oldPrice: 3000,
        discount: '40% OFF',
        bestseller: true,
      ),
      const CourseModel(
        title: 'Advanced JavaScript Development',
        image:
        'https://images.unsplash.com/photo-1516116216624-53e697fedbea?w=800',
        rating: 4.8,
        reviews: '980 reviews',
        duration: '10h 15m',
        price: 1400,
        oldPrice: 2200,
        discount: '36% OFF',
        bestseller: false,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommended Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xff111827),
              ),
            ),

            GestureDetector(
              onTap: onSeeAll,
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4F46E5),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // COURSE SLIDER
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 12.0;

            // 2 cards visible
            final cardWidth = (constraints.maxWidth - spacing) / 2;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  courses.length,
                      (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == courses.length - 1 ? 0 : spacing,
                      ),
                      child: SizedBox(
                        width: cardWidth,
                        child: _CourseCard(
                          course: courses[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ============================================================
// COURSE CARD
// ============================================================

class _CourseCard extends StatelessWidget {
  final CourseModel course;

  const _CourseCard({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffEEF0F4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Course Image
                Image.network(
                  course.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                      ) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Container(
                      color: const Color(0xffEEF2FF),
                      child: const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (
                      context,
                      error,
                      stackTrace,
                      ) {
                    return Container(
                      color: const Color(0xffEEF2FF),
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 35,
                          color: Color(0xff6366F1),
                        ),
                      ),
                    );
                  },
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 31,
                    height: 31,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),

                if (course.bestseller)
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xfffff3c4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Bestseller',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff292524),
                        ),
                      ),
                    ),
                  ),

                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.72),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 11,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          course.duration,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          // CONTENT
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff111827),
                  ),
                ),

                const SizedBox(height: 6),

                // RATING
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 17,
                      color: Color(0xffffb800),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      course.rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111827),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        '(${course.reviews})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // PRICE
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // PRICE
                    Text(
                      '৳${course.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff111827),
                      ),
                    ),

                    const SizedBox(width: 5),

                    // OLD PRICE
                    Text(
                      '৳${course.oldPrice}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff9CA3AF),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                    const Spacer(),

                    // DISCOUNT
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDCFCE7),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        course.discount,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff16A34A),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// COURSE MODEL
class CourseModel {
  final String title;
  final String image;
  final double rating;
  final String reviews;
  final String duration;
  final int price;
  final int oldPrice;
  final String discount;
  final bool bestseller;

  const CourseModel({
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.duration,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.bestseller,
  });
}