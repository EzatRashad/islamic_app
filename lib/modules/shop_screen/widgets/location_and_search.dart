import 'package:api_islamic/modules/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/core/utiles/utiles.dart';
import '../../../../core/themes/colors.dart';
import '../../../app_config_provider/app_config_provider.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        20.ph,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.primaryLight,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: provider.appTheme == ThemeMode.light
                        ? Colors.grey[300]
                        : AppColors.primaryDark,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: provider.appTheme == ThemeMode.light
                        ? Colors.black
                        : AppColors.white,
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: Theme.of(context).textTheme.titleSmall),
                onTapOutside: ((event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }),
              ),
            ),
            10.pw,
            InkWell(
              onTap: () {
                context.navigate(Cart());
              },
              child: Container(
                  height: 70.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    color: provider.appTheme == ThemeMode.light
                        ? Colors.grey[300]
                        : AppColors.primaryDark,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: AppColors.primaryLight,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
