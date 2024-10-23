import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/acadimic/screen/acadimic_screen.dart';
import 'package:api_islamic/modules/chapters_names/chapters_names.dart';
import 'package:api_islamic/modules/counter_Screen/counter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../azkar/azkar_Screen.dart';
import '../../hadeth_screen/hadeths_name.dart';
import '../../qiblah_screen/qiblah_main.dart';
import 'item_Widget.dart';
import 'item_model.dart';

class Items extends StatefulWidget {
  Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> itemsList = [
      ItemModel("assets/images/koran.png", AppLocalizations.of(context)!.quran,
          const ChaptersNames()),
      ItemModel("assets/images/praying.png",
          AppLocalizations.of(context)!.azkar, const Azkar_home()),
      ItemModel("assets/images/qibla.png", AppLocalizations.of(context)!.qiblah,
          const Qiblah()),
      ItemModel("assets/images/beads.png", AppLocalizations.of(context)!.sebha,
          const Count()),
      ItemModel("assets/images/hadith.jpg",
          AppLocalizations.of(context)!.hadith, const HadethScreen()),
      ItemModel("assets/images/education.png", AppLocalizations.of(context)!.learn,
          const Acadimic()),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      width: double.infinity,
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Item(
                itemModel: itemsList[index],
              ),
          separatorBuilder: (context, index) => 7.pw,
          itemCount: itemsList.length),
    );
  }
}
