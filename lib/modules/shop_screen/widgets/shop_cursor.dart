import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/themes/colors.dart';

class HomeCursor extends StatefulWidget {
  const HomeCursor({
    super.key,
  });

  @override
  State<HomeCursor> createState() => _HomeCursorState();
}

class _HomeCursorState extends State<HomeCursor> {
  int indexCrsoul = 0;
  List banners = [
    "assets/images/p3.jpg",
    "assets/images/p2.jpg",
    "assets/images/p1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: banners
              .map((e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.r),
                    height: 150.h,
                    width: 368.w,
                    child: Stack(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(fit: BoxFit.fill, e, width: double.infinity,
                            height: double.infinity,),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: 150.h,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 9),
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.easeIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              indexCrsoul = index;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.r),
          child: AnimatedSmoothIndicator(
            activeIndex: indexCrsoul,
            count: banners.length,
            axisDirection: Axis.horizontal,
            effect: ExpandingDotsEffect(
                dotHeight: 10.h,
                dotWidth: 10.w,
                activeDotColor: AppColors.primaryLight),
          ),
        ),
       ],
    );
  }
}
