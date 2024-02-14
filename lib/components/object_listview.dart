import 'package:flutter/material.dart';
import 'package:pack_wise/components/an_object.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/models/my_object.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class ObjectListView extends StatelessWidget {
  const ObjectListView({
    super.key,
    required this.textStyleInfo,
    required this.height,
    this.isInfo,
    this.objects,
  });
  final TextStyle textStyleInfo;
  final double height;
  final bool? isInfo;
  final List<MyObject>? objects;

  @override
  Widget build(BuildContext context) {
    return Consumer<BoxData>(builder: (context, boxData, child) {
      final newObjects = boxData.newObjects;
      final newObjectsLength = boxData.newObjectsLength;

      return Column(
        children: [
          SizedBox(
            height: height * 0.25,
            child: Material(
              borderRadius: kRadius,
              color: kAppBarColor.withOpacity(0.4),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: isInfo == true && objects!.isNotEmpty
                        ? objects!.length
                        : newObjectsLength,
                    itemBuilder: (context, i) {
                      if (isInfo == true && objects!.isNotEmpty) {
                        final objectName =
                            objects?[(objects!.length - 1) - i].name;
                        final objectQuantity =
                            objects?[(objects!.length - 1) - i].quantity;
                        return AnObject(
                          name: objectName!,
                          quantity: objectQuantity!,
                          index: i,
                          length: objects!.length,
                        );
                      }
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
