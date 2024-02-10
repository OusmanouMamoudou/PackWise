import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';

import 'package:pack_wise/const.dart';

class MyObjectCard extends StatelessWidget {
  const MyObjectCard({
    super.key,
    required this.name,
    required this.date,
    this.description,
  });
  final String name, date;
  final String? description;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.015,
        horizontal: width * 0.025,
      ),
      child: Material(
        color: kCardColor,
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Column(
          children: [
            Image.asset(
              kBox,
              height: height * 0.11,
              color: kBlue,
            ),
            Flexible(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.022,
                ),
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
