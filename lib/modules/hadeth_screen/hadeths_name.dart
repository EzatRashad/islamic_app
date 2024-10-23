import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../widgets/my_scaffold.dart';
import 'hadeth_screen.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MyScaffold(
      title: AppLocalizations.of(context)!.hadith,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:   AssetImage( provider.appTheme == ThemeMode.dark
                ? "assets/images/bdark-web.png"
                : "assets/images/blight-web.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HadethDetails(
                                    args: HadethModel(index: index),
                                    title: provider.applang == 'en'
                                        ? " ${AppLocalizations.of(context)!.hadithnum}  ${(index + 1).toString()} "
                                        : " الحديث رقم ${(index + 1).toString().toFarsi()}",
                                  )));
                    },
                    child: Text(
                      provider.applang == 'en'
                          ? " ${AppLocalizations.of(context)!.hadithnum}  ${(index + 1).toString()} "
                          : " الحديث رقم ${(index + 1).toString().toFarsi()}",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 50),
        ),
      ),
    );
  }
}

class HadethModel {
  HadethModel({
    required this.index,
  });

  int index;
}
