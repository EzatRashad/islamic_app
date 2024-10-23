import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../app_config_provider/app_config_provider.dart';
import '../../../core/themes/colors.dart';
import '../../details_screen/details_screen.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.5,
      children: List.generate(
        10,
        (index) => GestureDetector(
          onTap: () {
            context.navigate(Details(image: [
              Image.asset("assets/images/p.jpg"),
              Image.asset("assets/images/p.jpg"),
            ]));
          },
          child: Container(
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
             color:  provider.appTheme == ThemeMode.light
                 ? Colors.white
                 : AppColors.primaryDark,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 160.h,
                        color: Colors.white,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        'assets/images/p.jpg',
                        width: double.infinity,
                        height: 160.h,
                        fit: BoxFit.fill,

                      ),
                    ),
                  ],
                ),
                10.ph,
                SizedBox(
                  height: 45.h,
                  child: Text(
                    'المصحف الكريم',
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
                10.ph,
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
                        //  color: const Color.fromARGB(255, 226, 222, 222),
                        ),
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color:  provider.appTheme == ThemeMode.light
                            ? Colors.white
                            : AppColors.primaryDark,
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
