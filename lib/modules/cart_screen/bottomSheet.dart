import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomShet extends StatelessWidget {
  BottomShet({super.key});

  List<String> leftStrings = ["Delivery", "Pament", "Promo Code", "Total Cost"];
  List<String> rightStrings = [
    "Select method",
    "payment",
    "Pick discount",
    "\$13,97"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.check,
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Divider(),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  "${leftStrings[index]}",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "${rightStrings[index]}",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 26,
            );
          },
          itemCount: leftStrings.length,
        ),
        Divider(
          height: 30,
        ),
        Text(
          "By placing on order you agree to our ",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          "Terms And Conditions",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () {},
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(
                "Place order",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
