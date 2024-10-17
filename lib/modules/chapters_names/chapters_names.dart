import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../cubit/get_Quran/get_quran_cubit.dart';
import '../../cubit/get_Quran/get_quran_state.dart';
import '../chepter_verses/chepter_verses.dart';
import '../widgets/error.dart';
import '../widgets/loading.dart';
import '../widgets/my_scaffold.dart';

class ChaptersNames extends StatefulWidget {
  const ChaptersNames({super.key});

  @override
  State<ChaptersNames> createState() => _ChaptersNamesState();
}

class _ChaptersNamesState extends State<ChaptersNames> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return BlocProvider(
      create: (context) => GetQuranCubit()..getChapterData(),
      child: BlocConsumer<GetQuranCubit, GetQuranState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetQuranCubit.get(context);

          return MyScaffold(
            title: AppLocalizations.of(context)!.quran,
            body: state is QuranLoadingStates
                ? const Loading()
                : state is QuranGetErrorDataStates
                    ? const ErrorW()
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                provider.appTheme == ThemeMode.dark
                                    ? "assets/images/bdark-web.png"
                                    : "assets/images/blight-web.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: ListView.builder(
                            controller: _scrollController,
                            cacheExtent: 200.0,
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.cm!.chapters!.length,
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      final res = cubit.cm?.chapters?[index];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChapterVerses(
                                                    notftha: res!.id == 1 ||
                                                            res.id == 9
                                                        ? false
                                                        : true,
                                                    title: provider
                                                                .applang ==
                                                            'ar'
                                                        ? res.nameArabic
                                                                ?.toString() ??
                                                            ""
                                                        : res.nameSimple
                                                                ?.toString() ??
                                                            "",
                                                    count: res.versesCount ?? 0,
                                                    id: res.id ?? 0,
                                                  )));
                                    },
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Text(
                                              provider.applang == 'en'
                                                  ? cubit
                                                      .cm!.chapters![index].id
                                                      .toString()
                                                  : cubit
                                                      .cm!.chapters![index].id
                                                      .toString()
                                                      .toFarsi(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!,
                                            ),
                                            Image(
                                              image: const AssetImage(
                                                  'assets/images/star.png'),
                                              height: 40.h,
                                              width: 40.w,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                        15.pw,
                                        Text(
                                          provider.applang == 'en'
                                              ? cubit.cm!.chapters![index]
                                                  .nameSimple
                                                  .toString()
                                              : cubit.cm!.chapters![index]
                                                  .nameArabic
                                                  .toString(),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!,
                                        ),
                                        const Spacer(),
                                        Text(
                                          provider.applang == 'ar'
                                              ? cubit.cm!.chapters![index]
                                                          .revelationPlace
                                                          .toString() ==
                                                      "madinah"
                                                  ? "مدنيه"
                                                  : "مكيه"
                                              : cubit.cm!.chapters![index]
                                                  .revelationPlace
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
