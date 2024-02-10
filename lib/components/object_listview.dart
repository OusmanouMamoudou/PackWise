import 'package:flutter/material.dart';
import 'package:pack_wise/components/an_object.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class ObjectListView extends StatelessWidget {
  const ObjectListView(
      {super.key, required this.textStyleInfo, required this.height});
  final TextStyle textStyleInfo;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Consumer<BoxData>(builder: (context, boxData, child) {
      final newObjects = boxData.newObjects;
      final newObjectsLength = boxData.newObjectsLength;

      return Column(
        children: [
          const MyDivider(),
          SizedBox(height: height * 0.01),
          Text("Objects Ajoutés:", style: textStyleInfo),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.25,
            child: Material(
              borderRadius: kRadius,
              color: kAppBarColor.withOpacity(0.4),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: newObjectsLength,
                    itemBuilder: (context, i) {
                      final objectName =
                          newObjects[(newObjectsLength - 1) - i].name;
                      final objectQuantity =
                          newObjects[(newObjectsLength - 1) - i].quantity;
                      return AnObject(
                        name: objectName!,
                        quantity: objectQuantity!,
                        index: i,
                        length: newObjectsLength,
                      );
                    }),
              ),
            ),
          )
        ],
      );
    });
  }
}
