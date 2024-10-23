 import 'package:flutter/material.dart';

class Everylesson extends StatelessWidget {
  const Everylesson({super.key, required this.lessonTitle});
  final String lessonTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            lessonTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/video.png',
                            fit: BoxFit.fill,
                          )),
                      Center(
                          child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle_outline_outlined),
                        iconSize: 60,
                        color: Colors.white,
                      ))
                    ],
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'شرح الدرس: \n\n',
                            style: Theme.of(context).textTheme.titleSmall
                        ),
                        TextSpan(
                          text:
                              'في هذا الدرس، سنتناول أهمية الصلاة في حياة المسلم، وكيف أنها الركن الثاني من أركان الإسلام بعد الشهادة. سنوضح كيفية أداء الصلاة بشكل صحيح ونناقش الفوائد الروحية والبدنية للصلاة. كما سنتطرق إلى بعض الأخطاء الشائعة التي يقع فيها البعض أثناء الصلاة وكيف يمكن تجنبها.\n\n',
                            style: Theme.of(context).textTheme.titleSmall
                        ),
                        TextSpan(
                          text: 'الآيات والأحاديث المتعلقة بالصلاة: \n\n',
                            style: Theme.of(context).textTheme.titleSmall
                        ),
                        TextSpan(
                          text:
                              'قال الله تعالى: "إِنَّنِي أَنَا اللَّهُ لَا إِلَٰهَ إِلَّا أَنَا فَاعْبُدْنِي وَأَقِمِ الصَّلَاةَ لِذِكْرِي" (طه: 14)\n\nوقال النبي صلى الله عليه وسلم: "الصلاة عماد الدين، من أقامها فقد أقام الدين، ومن هدمها فقد هدم الدين".',
                            style: Theme.of(context).textTheme.titleSmall
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            )));
  }
}
