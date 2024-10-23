// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class answers extends StatefulWidget {
  answers({super.key});

  @override
  State<answers> createState() => _answersState();
}

class _answersState extends State<answers> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
            ),
            Text(
              'نَص الإجابة الأولي',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
            ),
            Text(
              'نَص الإجابة الثانيه',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
            ),
            Text(
              'نَص الإجابة الثالثه',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
            ),
            Text(
              'نَص الإجابة الرابعه',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ],
    );
  }
}
