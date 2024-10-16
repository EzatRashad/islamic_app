import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/settings_screen/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../core/themes/colors.dart';
import 'lang_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.ph,
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.appTheme == ThemeMode.light
                            ? AppLocalizations.of(context)!.light
                            : AppLocalizations.of(context)!.dark,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 19,
                                fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: provider.appTheme == ThemeMode.light
                            ? AppColors.black
                            : AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
              25.ph,
              Text(
                AppLocalizations.of(context)!.language,

                style: Theme.of(context).textTheme.titleLarge,
              ),
              10.ph,
              InkWell(
                onTap: () {
                  showLangBottomSheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.applang == 'en'
                            ? "${AppLocalizations.of(context)?.english}"
                            : "${AppLocalizations.of(context)?.arabic}",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Poppins",
                            fontSize: 19,
                            fontWeight: FontWeight.w300),
                      ),
                      Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        color: provider.appTheme == ThemeMode.light
                            ? AppColors.black
                            : AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }

  void showLangBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LangBottomSheet(),
    );
  }
}
