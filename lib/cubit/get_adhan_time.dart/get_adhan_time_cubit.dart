import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../data/adhan_time_api.dart';
import '../../models/adhan_time.dart';
import 'get_adhan_time_state.dart';

class GetAdhanTimeCubit extends Cubit<GetAdhanTimeState> {
  GetAdhanTimeCubit() : super(GetQuranInitial());

  static GetAdhanTimeCubit get(context) => BlocProvider.of(context);

  AdhanTimeModel? adhanTimeModel;

  // List to store prayer times
  List<String> adhanTimes = [];
  String hijri = '';

  void getAdhanTime() async {
    emit(GetAdhanTimeLoadingStates());
    try {
      final response = await AdhanDioHelper.getData(
        url: '/${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
        query: {
          'city': 'cairo',
          'country': 'egypt',
        },
      );

      adhanTimeModel = AdhanTimeModel.fromJson(response.data);

      hijri =
          "${adhanTimeModel?.data?.date?.hijri?.day.toString()} - ${adhanTimeModel?.data?.date?.hijri?.month?.ar} - ${adhanTimeModel?.data?.date?.hijri?.year.toString()}";
      _addTimeToList(adhanTimeModel?.data?.timings?.lastthird);

      _addTimeToList(adhanTimeModel?.data?.timings?.fajr);
      _addTimeToList(adhanTimeModel?.data?.timings?.sunrise);
      _addTimeToList(adhanTimeModel?.data?.timings?.dhuhr);
      _addTimeToList(adhanTimeModel?.data?.timings?.asr);
      _addTimeToList(adhanTimeModel?.data?.timings?.sunset);
      _addTimeToList(adhanTimeModel?.data?.timings?.maghrib);
      _addTimeToList(adhanTimeModel?.data?.timings?.isha);

      print("---------------------- ${adhanTimeModel?.data?.timings?.asr}");

      emit(GetAdhanTimeSuccessDataStates());
    } catch (error) {
      print("------------------------ ${error.toString()}");
      emit(GetAdhanTimeErrorDataStates(error.toString()));
    }
  }

  List<String> labels(BuildContext context) {
    return [
      AppLocalizations.of(context)!.lastthird,
      AppLocalizations.of(context)!.fajr,
      AppLocalizations.of(context)!.sunrise,
      AppLocalizations.of(context)!.dhuhr,
      AppLocalizations.of(context)!.asr,
      AppLocalizations.of(context)!.sunset,
      AppLocalizations.of(context)!.maghrib,
      AppLocalizations.of(context)!.isha,
    ];
  }

  void _addTimeToList(String? time) {
    if (time != null) {
      adhanTimes.add(time);
    }
  }
}
