import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/chepter_verses/tafsser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../core/themes/colors.dart';
import '../../cubit/get_Quran/get_quran_cubit.dart';

class VerseWidget extends StatelessWidget {
  const VerseWidget({super.key, required this.cubit, required this.index});

  final GetQuranCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onLongPress: () {
        showLangBottomSheet(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text:
                            "${cubit.surahModel?.result![index].arabicText} "));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(' بنجاح'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy_rounded,
                    color: AppColors.primaryLight,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    cubit.playOneAudio(cubit.audioUrls[index]);
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    color: AppColors.primaryLight,
                    size: 30,
                  ),
                ),
              ],
            ),
            Text(
              "${cubit.surahModel?.result![index].arabicText} ",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontFamily: "qalam",
                    fontSize: 27.sp,
                    height: 1.5.h,
                  ),
            ),
            Text(
              provider.applang == 'ar'
                  ? "\uFD3f ${(index + 1).toString().toFarsi()} \uFD3E "
                  : "\uFD3E ${(index + 1).toString()} \uFD3f ",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 25.sp,
                    height: 1.5.h,
                  ),
            )
          ],
        ),
      ),
    );
  }

  void showLangBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Tafsser(
        cubit: cubit,
        index: index,
      ),
    );
  }
}
