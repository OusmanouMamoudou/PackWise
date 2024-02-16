import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/screens/home.dart';

class BoxLength extends StatelessWidget {
  const BoxLength({super.key, required this.length, required this.isEmpty});
  final bool isEmpty;
  final int length;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();

    return isEmpty
        ? Image.asset(kLogo)
        : Padding(
            padding: EdgeInsets.all(height * 0.01),
            child: RoundedCard(
              child: Center(
                child: Text("$length",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kBlue,
                      fontSize: height * 0.025,
                    )),
              ),
            ),
          );
  }
}
