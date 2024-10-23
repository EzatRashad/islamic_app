import 'package:api_islamic/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../cubit/cubit.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, required this.cubit});

  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BottomAppBar(
        padding: const EdgeInsets.all(0),
        color: provider.appTheme == ThemeMode.light
            ? AppColors.primaryLight
            : AppColors.primaryDark,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: cubit.currentIndex,
          selectedFontSize: 16,
          onTap: (index) {
            cubit.changeIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: AppLocalizations.of(context)!.home,
            ),
             BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: AppLocalizations.of(context)!.shop,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
