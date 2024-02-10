import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.height,
    required this.iconData,
    required this.function,
  });

  final double height;
  final IconData? iconData;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Icon(
        iconData,
        size: height * 0.05,
      ),
    );
  }
}
