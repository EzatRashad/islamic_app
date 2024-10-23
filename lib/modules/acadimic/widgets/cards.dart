import 'package:flutter/material.dart';

import '../screen/subjects.dart';

class Cards extends StatelessWidget {
  const Cards(
      {super.key,
      required this.level,
      required this.openLevel,
      required this.levelNumber});

  final String level;
  final bool openLevel;
  final int levelNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        return openLevel
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => levelScreen(
                      levelTitle: level,
                      levelNumber: levelNumber,
                    )))
            : print('');
      },
      trailing: openLevel ? null : const Icon(Icons.lock_outline_rounded),
      leading: Text(
        level,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
