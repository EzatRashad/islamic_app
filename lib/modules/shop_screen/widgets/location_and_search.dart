import '/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/colors.dart';
  class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Excludeloc_icon.png"),
            10.pw,
            Text(
              "Mansoura, Talka",

            ),
          ],
        ),
        20.ph,
        TextFormField(
          cursorColor: AppColors.primaryLight,
          decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              prefixIcon: Icon(Icons.search),
              prefixIconColor: AppColors.black,
              hintText: "Search store"),
          onTapOutside: ((event) {
            FocusManager.instance.primaryFocus?.unfocus();
          }),
        ),
      ],
    );
  }
}
