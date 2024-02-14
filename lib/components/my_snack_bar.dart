import 'package:flutter/material.dart';
import 'package:pack_wise/const.dart';

class MySnackBar {
  static void mySnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: kCardColor,
      content: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: kBlue,
          )),
      duration: const Duration(seconds: 3),
    ));
  }
}
