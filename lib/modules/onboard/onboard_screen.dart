import 'dart:async';

import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/layout/layout.dart';
import 'package:api_islamic/modules/onboard/Widgets/translate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../data/cashe_helper.dart';
import 'Widgets/CustomIndicator.dart';
import 'constants.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;
  bool _isOut = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TranslateWidget(
                    txt: "EN",
                    onTap: () {
                      provider.changeLang("en");
                    },
                    color:
                        provider.applang == 'en' ? mainColor : Colors.grey[300],
                  ),
                  10.pw,
                  TranslateWidget(
                    txt: "عربي",
                    onTap: () {
                      provider.changeLang("ar");
                    },
                    color:
                        provider.applang == 'ar' ? mainColor : Colors.grey[300],
                  ),
                ],
              ),
              // Image and text content
              SizedBox(
                width: double.infinity,
                height: 330.h,
                child: AnimatedScale(
                  scale: _isOut ? 0 : 1,
                  duration: const Duration(milliseconds: 250),
                  child: Image.asset(images[index]),
                ),
              ),
              15.ph,
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      left: _isOut ? width(context) + 100 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        provider.applang == "en"
                            ? titles[index]
                            : arTitles[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      right: _isOut ? width(context) + 100 : 0,
                      duration: Duration(milliseconds: 250),
                      child: SizedBox(
                        width: width(context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: Text(
                            provider.applang == "en"
                                ? descriptions[index]
                                : arDescriptions[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              50.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIndicator(active: index == 0),
                  5.pw,
                  CustomIndicator(active: index == 1),
                  5.pw,
                  CustomIndicator(active: index == 2),
                  5.pw,
                  CustomIndicator(active: index == 3),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isOut = !_isOut;
                        });
                        Timer(
                          const Duration(milliseconds: 400),
                              () async {
                            if (index == 3) { // Change from index > 3 to index == 3
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Layout()),
                                    (Route<dynamic> route) => false,
                              );
                              await CasheHelper.saveData(key: 'onboard', value: false);
                            } else {
                              setState(() {
                                index = index + 1;
                                _isOut = !_isOut;
                              });
                            }
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Text(
                          provider.applang == "en" ? "Next" : "التالي",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Layout()),
                          (Route<dynamic> route) => false,
                        );
                        await CasheHelper.saveData(
                            key: 'onboard', value: false);
                      },
                      child: Text(
                        provider.applang == "en" ? "Skip" : "تخطي",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
