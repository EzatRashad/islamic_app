import 'package:api_islamic/modules/home_screen/home_screen.dart';
import 'package:api_islamic/modules/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings_screen/settings.dart';
import '../../shop_screen/shop_screen.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutinitialState());

  // To use object in eny screen
  static LayoutCubit get(context) => BlocProvider.of(context);

  // To manage Navbar Screens
  int currentIndex = 0;
  List screens = [
    const Home(),
    const ShopScreen(),
    const SettingsScreen(),

  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeNavState());
  }
}
