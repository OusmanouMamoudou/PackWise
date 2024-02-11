import 'package:flutter/material.dart';
import 'package:pack_wise/const.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.height,
    required this.function,
    required this.iconData,
  });

  final double height;
  final IconData? iconData;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Material(
        color: kAppBarColor,
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Padding(
          padding: EdgeInsets.all(height * 0.01),
          child: Icon(
            iconData,
            size: height * 0.04,
            color: iconData == Icons.delete
                ? const Color.fromARGB(255, 161, 15, 4)
                : kBlue,
          ),
        ),
      ),
    );
  }
}
