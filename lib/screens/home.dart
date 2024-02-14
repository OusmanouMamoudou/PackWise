import 'package:flutter/material.dart';
import 'package:pack_wise/screens/box_info.dart';
import 'package:pack_wise/components/empty_object.dart';
import 'package:pack_wise/components/my_floating_action.dart';
import 'package:pack_wise/components/my_object_card.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.title});
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Consumer<BoxData>(builder: (context, boxData, child) {
      final boxes = boxData.boxes;
      final length = boxData.boxesLength;
      return Scaffold(
        floatingActionButton: const MyFloatingActionB(),
        appBar: AppBar(title: title),
        body: boxes.isEmpty
            ? const EmptyObject()
            : boxes.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: length,
                    itemBuilder: (context, i) {
                      final boxName = boxes[i].name;
                      final boxDate = boxes[i].date;
                      final boxDescription = boxes[i].description;
                      final boxId = boxes[i].id;
                      final boxObjects = boxes[i].objects;
                      return MyObjectCard(
                        name: boxes[i].name!,
                        date: boxes[i].date.toString(),
                        function: () {
                          BoxInfo.bottomSheet(
                            context,
                            boxName!,
                            boxDescription!,
                            boxDate!,
                            boxId!,
                            boxObjects!,
                          );
                        },
                      );
                    })
                : const CircularProgressIndicator(),
      );
    });
  }
}
