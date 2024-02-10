import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';

class EmptyObject extends StatelessWidget {
  const EmptyObject({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/empty-box.png',
            height: height * 0.2,
            color: kAppBarColor,
          ),
          Text("Votre liste de carton est vide.",
              style: TextStyle(
                fontSize: height * 0.025,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
