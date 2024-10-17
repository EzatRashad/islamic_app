import 'package:api_islamic/modules/azkar/second_azkar/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../app_config_provider/app_config_provider.dart';
import '../../cubit/get_azkar/cubit.dart';
import '../../cubit/get_azkar/state.dart';
import '../../models/azkar_model.dart';
import '../widgets/error.dart';
import '../widgets/loading.dart';
import '../widgets/my_scaffold.dart';

class Azkar_home extends StatefulWidget {
  const Azkar_home({Key? key}) : super(key: key);

  @override
  State<Azkar_home> createState() => _Azkar_homeState();
}

class _Azkar_homeState extends State<Azkar_home> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder(
            future: CounterCubit.get(context).getAzkarData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<AzkarM>> snapshot) {
              if (snapshot.hasData) {
                return MyScaffold(
                  title: AppLocalizations.of(context)!.azkar,
                  body: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(provider.appTheme == ThemeMode.dark
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
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Zkr(
                                            azkar:
                                            (snapshot.data?[index].array) ??
                                                [],
                                            title:
                                            snapshot.data![index].category!,
                                          ),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Image(
                                        image: const AssetImage('assets/images/sta.png'),
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 8), // Optional: Add some space between the image and text
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0.0),
                                          child: Text(
                                            snapshot.data![index].category!,
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context).textTheme.titleSmall!,
                                            maxLines: 3, // Set the maximum number of lines
                                            overflow: TextOverflow.ellipsis, // Show ellipsis if the text exceeds maxLines
                                          ),
                                        ),
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
                  ),
                );
              } else if (snapshot.hasError) {
                print("Errrrorr ${snapshot.error.toString()}");
                return const ErrorW();
              } else {
                return const Center(child: Loading());
              }
            },
          );
        },
      ),
    );
  }
}
