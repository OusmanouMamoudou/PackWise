import 'package:flutter/material.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/screen_size.dart';

class AnObject extends StatelessWidget {
  const AnObject(
      {super.key,
      required this.name,
      required this.quantity,
      required this.index,
      required this.length});
  final String name;
  final int quantity, length, index;
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: TextStyle(
                      fontWeight: FontWeight.w900, fontSize: height * 0.025)),
              Text(quantity.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: height * 0.02)),
            ],
          ),
        ),
        if (index != length - 1) ...[
          SizedBox(height: height * 0.01),
          const MyDivider(),
        ]
      ],
    );
  }
}
