import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/screens/home.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    return ChangeNotifierProvider<BoxData>(
      create: (context) => BoxData(),
      builder: (context, child) => MaterialApp(
        title: 'PackWise',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffDBB781),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kBlue,
              ),
          fontFamily: "Roboto",
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: kAppBarColor,
            centerTitle: true,
            titleSpacing: 0.25,
            iconTheme: IconThemeData(
              color: kBackgroundColor,
              size: height * 0.04,
            ),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: height * 0.035,
              color: kBackgroundColor,
            ),
            elevation: 10,
          ),
          useMaterial3: true,
        ),
        home: const Home(title: Text('PackWise')),
      ),
    );
  }
}
