import 'package:flutter/material.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/screens/home.dart';
import 'package:pack_wise/screens/scan_screen.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key, required this.isEmpty});
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScanScreen()),
        );
      },
      icon: RoundedCard(
        child: Image.asset(
          kScan,
          color: isEmpty ? kAppBarColor : kBlue,
        ),
      ),
    );
  }
}
