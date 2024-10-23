import 'package:api_islamic/core/themes/colors.dart';
import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../constant.dart';
import '../widgets/cardStructure.dart';

class Acadimic extends StatefulWidget {
  const Acadimic({super.key});

  @override
  State<Acadimic> createState() => _AcadimicState();
}

class _AcadimicState extends State<Acadimic> {
  List<LevelModel> levels = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    levels = [
      LevelModel(AppLocalizations.of(context)!.levelOne, true, 1),
      LevelModel(AppLocalizations.of(context)!.levelTwo, false, 2),
      LevelModel(AppLocalizations.of(context)!.levelThree, false, 3),
      LevelModel(AppLocalizations.of(context)!.levelFour, false, 4),
    ];

    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? AppColors.primaryLight
          : AppColors.primaryDark,
      // background color
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                AppLocalizations.of(context)!.levelTitle,
                style: titleStyle,
              ),
            ),
            centerTitle: true,
          )),
      body: Container(
        padding: EdgeInsets.only(top: 40.r),
        decoration: BoxDecoration(
            color: provider.appTheme == ThemeMode.light
                ? Colors.white
                : AppColors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
          child: ListView.separated(
              itemBuilder: (context, index) => Cardstructure(
                    levelModel: levels[index],
                  ),
              separatorBuilder: (context, index) => 25.ph,
              itemCount: 4),
        ),
      ),
    );
  }
}

class LevelModel {
  String level;

  bool openLevel;
  int levelNumber;

  LevelModel(this.level, this.openLevel, this.levelNumber);
}
