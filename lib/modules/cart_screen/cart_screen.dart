import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:api_islamic/modules/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: AppLocalizations.of(context)!.cart,
      body: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return EachItemInCart();
                },
                separatorBuilder: (BuildContext, int) {
                  return const Divider();
                },
                itemCount: 10),
          ),
        ],
      )),
    );
  }
}

class EachItemInCart extends StatefulWidget {
  EachItemInCart({super.key});

  @override
  State<EachItemInCart> createState() => _EachItemInCartState();
}

class _EachItemInCartState extends State<EachItemInCart> {
  int numberOfBought = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/p.jpg",
              width: 110.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "المصحف الكريم",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (numberOfBought > 0) {
                        numberOfBought--;
                      }
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.grey,
                      size: 45,
                    ),
                  ),

                  Text(
                    "$numberOfBought",
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),

                  IconButton(
                      onPressed: () {
                        numberOfBought++;

                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_circle_outline_outlined,
                        color: Colors.green[300],
                        size: 45,
                      )),

                  // const Spacer(),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.grey,
                  )),
              Text(
                "100 ج.م",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
