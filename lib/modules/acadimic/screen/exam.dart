import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../../../core/themes/colors.dart';
import '../constant.dart';
import '../widgets/questions_Answer.dart';
import 'acadimic_screen.dart';

class examScreen extends StatefulWidget {
  const examScreen({super.key, required this.levelNumber, required this.level});

  final int levelNumber;
  final String level;

  @override
  State<examScreen> createState() => _examScreenState();
}

class _examScreenState extends State<examScreen> {
  final List questions = const [
    'نَص السؤال الأول',
    'نَص السؤال الثاني',
    'نَص السؤال الثالث',
    'نَص السؤال الرابع',
    'نَص السؤال الخامس',
    'نَص السؤال السادس',
    'نَص السؤال السابع',
    'نَص السؤال الثامن',
    'نَص السؤال التاسع',
    'نَص السؤال العاشر',
    'نَص السؤال الحادي عشر',
    'نَص السؤال الثاني عشر',
  ];

  @override
  Widget build(context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:   Text(widget.level),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Card(
                  color:  provider.appTheme == ThemeMode.light
                      ? AppColors.primaryLight
                      : AppColors.primaryDark,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(questions[index],
                            style: Theme.of(context).textTheme.titleMedium,
                            textDirection: TextDirection.rtl),
                        const Divider(),
                        answers(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    switch (widget.levelNumber) {
                      case 1:
                        openLevel2 = true;
                        break;
                      case 2:
                        openLevel3 = true;
                        break;
                      case 3:
                        openLevel4 = true;
                        break;
                      default:
                    }
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Acadimic();
                        },
                      ),
                      (route) => false,
                    );
                  });
                },
                style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size.fromHeight(50))),
                child: const Text(sendTheExam, style: examTitleStyle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
