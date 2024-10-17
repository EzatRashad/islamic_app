import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:api_islamic/modules/layout/layout.dart';
import 'package:api_islamic/modules/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/cashe_helper.dart';

class SplasgScreen extends StatelessWidget {
  const SplasgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/images/muslimm.png',
        fit: BoxFit.contain,
        height: 400.h,
        width: 400.w,
        alignment: Alignment.center,
      ),
      splashIconSize: double.infinity,
      nextScreen: CasheHelper.getData(key: 'onboard') != null
          ? CasheHelper.getData(key: 'onboard')
              ? OnboardScreen()
              : Layout()
          : OnboardScreen(),
    );
  }
}
