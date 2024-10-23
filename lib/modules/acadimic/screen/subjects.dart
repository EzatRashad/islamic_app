import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constant.dart';
import '../model/courseIconModel.dart';
import 'exam.dart';
import 'lessons.dart';

class levelScreen extends StatelessWidget {
  levelScreen({super.key, required this.levelTitle, required this.levelNumber});

  final String levelTitle;
  final int levelNumber;

  List<CourseIconModel> courseModel = [];

  @override
  Widget build(BuildContext context) {
    courseModel = [
      CourseIconModel(
          courseImage: 'assets/images/tafsir.png',
          courseTitle: AppLocalizations.of(context)!.tafsir),
      CourseIconModel(
          courseImage: 'assets/images/feqh.png',
          courseTitle: AppLocalizations.of(context)!.fiqh),
      CourseIconModel(
          courseImage: 'assets/images/Hadith.png',
          courseTitle: AppLocalizations.of(context)!.hadith),
      CourseIconModel(
          courseImage: 'assets/images/sirah.png',
          courseTitle: AppLocalizations.of(context)!.seerah),
      CourseIconModel(
          courseImage: 'assets/images/tawheed.png',
          courseTitle: AppLocalizations.of(context)!.tawhid),
      CourseIconModel(
          courseImage: 'assets/images/3aqeda.png',
          courseTitle: AppLocalizations.of(context)!.aqidah),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          levelTitle,
          style: levelsTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return subjectscreen(
                                    title: courseModel[index].courseTitle,
                                    image: courseModel[index].courseImage);
                              },
                            ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0)),
                            elevation: 5,
                            child: Image.asset(
                              courseModel[index].courseImage,
                              height: 90,
                              width: 90,
                            ),
                          )),
                      Text(
                        courseModel[index].courseTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  );
                },
                itemCount: courseModel.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return examScreen(levelNumber: levelNumber,level: levelTitle,);
                  },
                ));
              },
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(Size.fromHeight(50))),
              child: const Text(
                exam,
                style: examTitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
