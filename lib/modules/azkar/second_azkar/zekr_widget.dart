
import 'package:api_islamic/core/utiles/utiles.dart';
import 'package:flutter/material.dart';

import '../../../models/azkar_model.dart';
// ignore: must_be_immutable
class ZekrWidget extends StatefulWidget {
  ZekrWidget({Key? key, required this.zekr}) : super(key: key);
  Array? zekr;
  @override
  State<ZekrWidget> createState() => _ZekrWidgetState();
}

class _ZekrWidgetState extends State<ZekrWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0Xff9E6F21),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FittedBox(
                              child: Text(
                                count.toString().toFarsi(),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0Xff9E6F21),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "عدد المرات ${widget.zekr?.count.toString().toFarsi() ?? ''}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.zekr?.text ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                      // textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          count++;
        });
      },
    );
  }
}
