import 'dart:convert';

import 'package:api_islamic/cubit/get_azkar/state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/azkar_model.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counternum = 0;
  bool vibrate = true;

  void changev() {
    vibrate = !vibrate;
    emit(CounterVIBState( ));
  }

  vib() {
    vibrate==true ? HapticFeedback.vibrate() : null;

  }

  void plus() {
    counternum++;
    vib();
    emit(CounterPlusState( ));
  }

  void zero() {
    counternum = 0;
    vib();
    emit(CounterzeroState( ));
  }

  Future<List<AzkarM>> getAzkarData() async {
    String jsonData = await rootBundle.loadString('assets/myjson/azkar.json');
    List<AzkarM> jsonList = [];
    List<dynamic> myJsonDecode = json.decode(jsonData) as List<dynamic>;

    for (var e in myJsonDecode) {
      jsonList.add(AzkarM.fromMap(e));
    }
    return jsonList;
  }
}
