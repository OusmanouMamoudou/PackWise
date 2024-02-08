import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.title});
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title:title), body:Center());
  }
}
