import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/colors.dart';
import '../../../cubit/get_adhan_time.dart/get_adhan_time_cubit.dart';
import '../../../cubit/get_adhan_time.dart/get_adhan_time_state.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAdhanTimeCubit()..getAdhanTime(),
      child: BlocConsumer<GetAdhanTimeCubit, GetAdhanTimeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetAdhanTimeCubit.get(context);

          return Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  (DateTime.now().hour >= 6 && DateTime.now().hour <= 18)
                      ? "assets/images/light.jpg"
                      : "assets/images/time.jpg",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: state is GetAdhanTimeLoadingStates
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.white,
                  ))
                : state is GetAdhanTimeSuccessDataStates
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              cubit.hijri,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 80.h,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              itemCount: 8,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          '${cubit.labels(context)[index]}\n${cubit.adhanTimes[index]}',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          15.ph,
                        ],
                      )
                    : const Center(
                        child: Text(
                          'Failed to load Adan times',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
