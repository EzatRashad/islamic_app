import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../../../cubit/get_azkar/cubit.dart';
import '../../../cubit/get_azkar/state.dart';

class CounterS extends StatefulWidget {
  const CounterS({super.key});

  @override
  State<CounterS> createState() => _CounterSState();
}

class _CounterSState extends State<CounterS> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            CounterCubit.get(context).plus();
          },
          child: Center(
              child: Container(
            height: 300.h,
            width: 300.w,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0Xff9E6F21), width: 5.w),
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                provider.applang == 'ar'
                    ?
                CounterCubit.get(context).counternum.toString().toFarsi():CounterCubit.get(context).counternum.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          )),
        );
      },
    );
  }
}
