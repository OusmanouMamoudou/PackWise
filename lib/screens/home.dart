import 'package:flutter/material.dart';
import 'package:pack_wise/components/app_bar_button.dart';
import 'package:pack_wise/components/box_length.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/screens/box_info.dart';
import 'package:pack_wise/components/empty_object.dart';
import 'package:pack_wise/components/my_floating_action.dart';
import 'package:pack_wise/components/my_object_card.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.title});
  final Widget? title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFetching = true;

  void fetching() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isFetching = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetching();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BoxData>(builder: (context, boxData, child) {
      final boxes = boxData.boxes;
      final length = boxData.boxesLength;
      final isEmpty = boxData.boxes.isEmpty;

      return Scaffold(
          floatingActionButton: const MyFloatingActionB(),
          appBar: AppBar(
            title: widget.title,
            leading: BoxLength(length: length, isEmpty: isEmpty),
            actions: [
              AppBarButton(isEmpty: isEmpty),
            ],
          ),
          body: Container(
            child: isFetching
                ? const Center(
                    child: CircularProgressIndicator(
                    color: kAppBarColor,
                  ))
                : boxes.isEmpty
                    ? const EmptyObject()
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: length,
                        itemBuilder: (context, i) {
                          return MyObjectCard(
                            name: boxes[i].name!,
                            date: boxes[i].date.toString(),
                            function: () {
                              BoxInfo.bottomSheet(
                                  context, boxData, i, null, null);
                            },
                          );
                        }),
          ));
    });
  }
}

class RoundedCard extends StatelessWidget {
  const RoundedCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kAppBarColor,
      elevation: 10,
      borderRadius: kRadius,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Material(
            color: kBackgroundColor,
            elevation: 10,
            borderRadius: kRadius,
            child: child),
      ),
    );
  }
}
