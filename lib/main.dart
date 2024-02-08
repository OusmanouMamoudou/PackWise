import 'package:flutter/material.dart';
import 'package:pack_wise/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PackWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(
          title:
              Text('PackWise', style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
