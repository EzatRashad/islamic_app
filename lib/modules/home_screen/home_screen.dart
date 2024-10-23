import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';

import 'components/aya.dart';
import 'components/banner.dart';
import 'components/items.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBanner(),
              25.ph,
              Items(),
              10.ph,
              Aya(),
            ],
          ),
        ],
      ),
    );
  }
}
