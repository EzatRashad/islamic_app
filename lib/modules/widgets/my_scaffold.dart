import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    super.key,
    required this.title,
    required this.body, this.action,
  });

  final String title;
  final Widget body;
  final Widget? action;



  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              widget.title,
            ),
          ),
          centerTitle: true,
          actions: [
            widget.action??Container(),
            15.pw,
          ],
        ),
        body: widget.body,
      ),
    );
  }
}
