import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';

class Aya extends StatefulWidget {
  const Aya({super.key});

  @override
  State<Aya> createState() => _AyaState();
}

class _AyaState extends State<Aya> {
  final List<String> ayat = [
    "رَبَّنَا اغْفِرْ لَنَا ذُنُوْبَنَا وَ اِسْرَافَنَا فِيْٓ اَمْرِنَا وَثَبِّتْ اَقْدَامَنَا وَانْصُرْنَا عَلَي الْقَوْمِ الْكٰفِرِيْنَ",
    "رَبَّنَآ ءَامَنَّا بِمَآ أَنزَلۡتَ وَٱتَّبَعۡنَا ٱلرَّسُولَ فَٱكۡتُبۡنَا مَعَ ٱلشَّٰهِدِينَ",
    "رَبَّنَآ اِنَّنَآ اٰمَنَّا فَاغْفِرْ لَنَا ذُنُوْبَنَا وَقِنَا عَذَابَ النَّارِ",
    "رَبَّنَا إِنَّكَ جَامِعُ النَّاسِ لِيَوْمٍ لاَّ رَيْبَ فِيهِ إِنَّ اللّهَ لاَ يُخْلِفُ الْمِيعَادَ",
    "رَبَّنَا لَا تُزِغْ قُلُوْبَنَا بَعْدَ اِذْ ھَدَيْتَنَا وَھَبْ لَنَا مِنْ لَّدُنْكَ رَحْمَةً ۚ اِنَّكَ اَنْتَ الْوَھَّابُ",
    "ۭرَبَّنَا لَا تُؤَاخِذْنَآ اِنْ نَّسِيْنَآ اَوْ اَخْطَاْنَا ۚ رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَآ اِصْرًا كَمَا حَمَلْتَهٗ عَلَي الَّذِيْنَ مِنْ قَبْلِنَا ۚ رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهٖ ۚ وَاعْفُ عَنَّا ۪ وَاغْفِرْ لَنَا ۪ وَارْحَمْنَا ۪ اَنْتَ مَوْلٰىنَا فَانْــصُرْنَا عَلَي الْقَوْمِ الْكٰفِرِيْنَ",
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % ayat.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.r, vertical: 20.0.r),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Theme.of(context).primaryColor,
              border: Border.all(color: AppColors.primaryLight),
            ),
            child: Center(
              child: Text(
                ayat[_currentIndex],
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16.sp),
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: ayat[_currentIndex]));
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
          ),
        ],
      ),
    );
  }
}
