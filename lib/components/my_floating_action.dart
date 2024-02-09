import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';

class MyFloatingActionB extends StatelessWidget {
  const MyFloatingActionB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();

    return FloatingActionButton(
        backgroundColor: kAppBarColor,
        tooltip: "Ajouter un nouveau carton",
        onPressed: () {},
        child: Image.asset(
          kBoxAdd,
          height: height * 0.05,
        ));
  }
}
