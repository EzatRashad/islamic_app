import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';

class CartBtn extends StatefulWidget {
  const CartBtn({super.key});

  @override
  State<CartBtn> createState() => _CartBtnState();
}

class _CartBtnState extends State<CartBtn> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
        child: Icon(
                Icons.add_shopping_cart_outlined,
                color: AppColors.primaryLight,
                size: 35.sp,
              ),
      ),
    );
  }
}
