import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/colors.dart';
import '../../cubit/get_Quran/get_quran_cubit.dart';

class Tafsser extends StatelessWidget {
  const Tafsser({super.key, required this.cubit, required this.index});

  final GetQuranCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {

                  Clipboard.setData(ClipboardData(
                      text:
                          "${cubit.surahModel?.result![index].translation} "));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم النسخ بنجاح'),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.copy_rounded,
                  color: AppColors.primaryLight,
                ),
              ),
              Text(
                "\uFD3f ${(index + 1).toString().toFarsi()} \uFD3E",
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 23.sp,
                      height: 1.5.h,
                    ),
              ),
            ],
          ),
          Text(
            "${cubit.surahModel?.result![index].translation} ",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 20.sp,
                  height: 1.5.h,
                ),
          ),
        ],
      ),
    );
  }
}
