import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/colors.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 25.r),
        child: Container(
            width: 30.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white.withOpacity(.8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                  size: 20,
                ),
              ),
            )),
      ),
    );
  }
}
