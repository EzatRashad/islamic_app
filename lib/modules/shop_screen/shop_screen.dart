
import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/shop_screen/widgets/location_and_search.dart';
import 'package:api_islamic/modules/shop_screen/widgets/products.dart';
import 'package:api_islamic/modules/shop_screen/widgets/shop_cursor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/colors.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: ListView(children: [
            30.ph,
            const HomeBar(),
            20.ph,
            HomeCursor(

            ),
            30.ph,
            Expanded(
                child: Products(

                ))
          ]),
        ),
        ),
      );
   }
}
