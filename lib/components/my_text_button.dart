import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.text,
    this.function,
    required this.width,
  });

  final String? text;
  final void Function()? function;
  final double width;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();

    return TextButton(
        onPressed: function,
        child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: kAppBarColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.012,
                horizontal: width,
              ),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )));
  }
}
