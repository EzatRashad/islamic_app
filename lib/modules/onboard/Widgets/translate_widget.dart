import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../app_config_provider/app_config_provider.dart';
import '../constants.dart';

class TranslateWidget extends StatelessWidget {
  const TranslateWidget({super.key, this.onTap, required this.txt, this.color});
final void Function()? onTap;
final String txt;
final Color? color;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          txt,
          style: TextStyle(
            color:  Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
