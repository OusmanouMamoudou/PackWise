import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double width = screenSize.width();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.35,
        vertical: 3.5,
      ),
      child: Material(
        color: kAppBarColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.6, vertical: 0.1),
          child: const Card(),
        ),
      ),
    );
  }
}
