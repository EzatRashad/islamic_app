import 'package:api_islamic/cubit/get_azkar/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app_config_provider/app_config_provider.dart';
import 'core/themes/theme.dart';
import 'cubit/blockObserver.dart';
import 'data/adhan_time_api.dart';
import 'data/cashe_helper.dart';
import 'data/quran_api.dart';
import 'data/surah_api.dart';
import 'modules/splash_screen/splash_sccreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  AdhanDioHelper.init();
   DioHelper.init();
  await CasheHelper.init();
   SurahDioHelper.init();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        var provider = Provider.of<AppConfigProvider>(context);

        return MultiBlocProvider(
          providers: [
            BlocProvider(create:  (context) => CounterCubit(),),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // Pass `toHome` to Splash to decide the next screen
            home: const SplasgScreen(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(provider.applang),
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: provider.appTheme,
          ),
        );
      },
    );
  }
}
