import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../core/themes/colors.dart';


class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.of(context).pop();

            },
            child: provider.appTheme == ThemeMode.light
                ? getSelcted("${AppLocalizations.of(context)?.light}")
                : getunSelcted("${AppLocalizations.of(context)?.light}"),
          ),
          const Divider(
            height: 30,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.of(context).pop();

            },
            child: provider.appTheme == ThemeMode.dark
                ? getSelcted("${AppLocalizations.of(context)?.dark}")
                : getunSelcted("${AppLocalizations.of(context)?.dark}"),
          ),
        ],
      ),
    );
  }

  Widget getSelcted(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontFamily: "Poppins",
            fontSize: 19,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryLight,
          ),
        ),
        const Icon(
          Icons.check,
          color: AppColors.primaryLight,
        ),
      ],
    );
  }

  Widget getunSelcted(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: "Poppins",
              fontSize: 19,
              fontWeight: FontWeight.w300,
              color: AppColors.black),
        ),
      ],
    );
  }
}
