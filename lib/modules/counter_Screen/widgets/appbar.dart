import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/get_azkar/cubit.dart';
import '../../../cubit/get_azkar/state.dart';

class AppBarCW extends StatefulWidget {
  const AppBarCW({super.key});

  @override
  State<AppBarCW> createState() => _AppBarCWState();
}

class _AppBarCWState extends State<AppBarCW> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: 200.h,
              decoration: const BoxDecoration(
                color: Color(0Xff9E6F21),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Text(
                "''فَسَبِّحْ بِحَمْدِ رَبِّكَ''",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.sp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    CounterCubit.get(context).zero();
                  },
                  icon: Icon(
                    Icons.restart_alt,
                    size: 50.sp,
                    color: const Color(0Xff9E6F21),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    CounterCubit.get(context).changev();
                  },
                  icon: Icon(
                    Icons.vibration,
                    size: 50.sp,
                    color: const Color(0Xff9E6F21),
                  ),
                ),
                SizedBox(
                  width: 40.w,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
