import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../../../core/themes/colors.dart';
import '../constant.dart';
import 'everylesson.dart';

class subjectscreen extends StatelessWidget {
  const subjectscreen({super.key, required this.title, required this.image});

  final String title;

  final String image;

  final List lessons = const [
    'الدرس الأول',
    'الدرس الثاني',
    'الدرس الثالث',
    'الدرس الرابع',
    'الدرس الخامس',
    'الدرس السادس',
    'الدرس السابع',
    'الدرس الثامن',
    'الدرس التاسع',
    'الدرس العاشر',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: levelsTitleStyle,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      context.navigate(Everylesson(
                        lessonTitle: lessons[index],
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: provider.appTheme == ThemeMode.light
                              ? AppColors.primaryLight
                              : AppColors.primaryDark,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 80,
                      child: Row(children: [
                        Spacer(),
                        Text(
                          lessons[index],
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        10.pw,
                        Image.asset(image),
                      ]),
                    ),
                  ),
                );
              },
              itemCount: lessons.length),
        ));
  }
}
