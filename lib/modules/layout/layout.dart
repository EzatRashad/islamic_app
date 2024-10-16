import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/bottomNavigationBar_widget.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});
  static const String routeName = "layout_route";

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return SafeArea(
            child: Scaffold(
                 body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: NavBarWidget(
                  cubit: cubit,
                )),
          );
        },
      ),
    );
  }
}
