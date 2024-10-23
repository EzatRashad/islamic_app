import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/cart_screen/cart_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/themes/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.image});

  final List<Widget> image;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List banners = [
    "assets/images/p3.jpg",
    "assets/images/p2.jpg",
    "assets/images/p1.jpg",
  ];

  int indexCrsoul = 0;
  int count = 0;
  bool isVisible1 = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(onPressed: () {
            context.navigate(Cart());
          }, icon:  Icon(
            Icons.shopping_cart,
            color: AppColors.white,
          ))],
          ),
       body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [

                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400.h,

                      autoPlay: false,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      onPageChanged: (index, reason) {
                        indexCrsoul = index;
                        setState(() {});
                      },
                    ),
                    items: banners
                        .map((e) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 0.r),
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
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(fit: BoxFit.cover, e, width: double.infinity,
                                      height: double.infinity,),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: AnimatedSmoothIndicator(
                      activeIndex: indexCrsoul,
                      count: banners.length,
                      axisDirection: Axis.horizontal,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                        activeDotColor: AppColors.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
              20.ph,
              Text(
                "القران الكريم",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              15.ph,
              Text(
                "منهج متخصص في تدبر القرآن الكريم والعمل به وفق منهج أهل السنة والجماعة، يعرض كل وجه من القرآن كمقطع مستقل، مطبوع على ورق كريمي بحجم 20×28.",
                 style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontSize: 16.sp),
              ),
              20.ph,
              Row(
                children: [
                  Text(
                    "100 ${AppLocalizations.of(context)!.le}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 35.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: const Color.fromARGB(255, 226, 222, 222),
                      ),
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.white,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
