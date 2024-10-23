import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_model.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  itemModel.image,
                ),
                fit: BoxFit.contain,
                width: 60.w,
              ),
              Spacer(),
              Text(
                itemModel.text,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => itemModel.screen,
              ));
        },
      ),
    );
  }
}
