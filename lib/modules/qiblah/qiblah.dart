 import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

 import '../widgets/error.dart';
import '../widgets/my_scaffold.dart';
import 'compass.dart';
import 'loading.dart';

class MyQiblah extends StatefulWidget {
  const MyQiblah({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyQiblah> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        title: AppLocalizations.of(context)!.qiblah,
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            }
            if (snapshot.hasError) {
              return const Center(
                child: ErrorW(),
              );
            }

            if (snapshot.data!) {
              return QiblahCompass();
            } else {
              return const Center(child: ErrorW());
            }
          },
        ));
  }
}
