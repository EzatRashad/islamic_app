
import 'package:api_islamic/modules/counter_Screen/widgets/appbar.dart';
import 'package:api_islamic/modules/counter_Screen/widgets/counter.dart';
import 'package:api_islamic/modules/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_screen/home_screen.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarCW(),
            SizedBox(height: 40.h),
            const CounterS(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //CounterCubit.get(context).changeColor();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Layout(),
                ));
          },
          backgroundColor: const Color(0Xff9E6F21),
          label: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
            size: 35,
          )
          /*icon: Icon(
              Icons.add,
            color: Colors.orangeAccent,
          ),*/
          ),
    );
  }
}
