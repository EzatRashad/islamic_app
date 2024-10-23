import 'package:api_islamic/modules/acadimic/screen/acadimic_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../../../core/themes/colors.dart';
import 'cards.dart';

class Cardstructure extends StatelessWidget {
  const Cardstructure({
    super.key,
    required this.levelModel,
  });

  final LevelModel levelModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color:  provider.appTheme == ThemeMode.light
              ? AppColors.primaryLight
              : AppColors.primaryDark,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [
            BoxShadow(
              color:  provider.appTheme == ThemeMode.light
                  ? AppColors.black
                  : AppColors.primaryLight,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ]),
      child: Cards(
          level: levelModel.level,
          openLevel: levelModel.openLevel,
          levelNumber: levelModel.levelNumber),
    );
  }
}
