import 'package:flutter/material.dart';
import 'package:pack_wise/components/an_object.dart';
import 'package:pack_wise/components/arrow_button.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_text_button.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/models/box.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class MyForm extends StatelessWidget {
  const MyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();

    int id = 0;
    String? boxName, boxDescription, objectName;

    var textStyleInfo = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: height * 0.017,
      fontStyle: FontStyle.italic,
    );
    var textStyleStyle = TextStyle(
      fontSize: height * 0.02,
      fontWeight: FontWeight.w700,
    );

    return Material(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kCardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 3),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Ajouter un nouveau Carton',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.03,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Material(
                          color: kAppBarColor,
                          elevation: 10,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.close,
                              size: height * 0.04,
                            ),
                          ),
                        ),
                      )
                    ]),
                Consumer<BoxData>(builder: (context, boxData, child) {
                  final newObjects = boxData.newObjects;
                  final newObjectsLength = boxData.newObjectsLength;
                  final quantity = boxData.getQuantity;
                  return Form(
                      child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      const MyDivider(),
                      SizedBox(height: height * 0.01),
                      Text("Informations du Carton: ", style: textStyleInfo),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: TextFormField(
                            onChanged: (value) {
                              boxName = value;
                            },
                            style: textStyleStyle,
                            decoration: kInputDecoration.copyWith(
                              labelText: "Nom",
                              labelStyle: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w900),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: TextFormField(
                            onChanged: (value) {
                              boxDescription = value;
                            },
                            style: textStyleStyle,
                            decoration: kInputDecoration.copyWith(
                              labelText: "Description",
                              labelStyle: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w900),
                            )),
                      ),
                      const MyDivider(),
                      SizedBox(height: height * 0.01),
                      Text("Informations des Objects:", style: textStyleInfo),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: TextFormField(
                            onChanged: (value) {
                              objectName = value;
                            },
                            style: textStyleStyle,
                            decoration: kInputDecoration.copyWith(
                              labelText: "Nom d'objet",
                              labelStyle: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w900),
                            )),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                                bottom: height * 0.01,
                              ),
                              child: TextFormField(
                                  onChanged: (value) {
                                    boxData.addQuantity(value);
                                  },
                                  textAlign: TextAlign.center,
                                  style: textStyleStyle,
                                  decoration: kInputDecoration.copyWith(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.033),
                                    hintText: quantity.toString(),
                                    hintStyle: TextStyle(
                                      fontSize: height * 0.025,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Material(
                            borderRadius: kRadius,
                            color: kAppBarColor,
                            elevation: 10,
                            child: Column(children: [
                              ArrowButton(
                                function: () {
                                  boxData.increaseQuantity();
                                },
                                height: height,
                                iconData: Icons.arrow_drop_up_outlined,
                              ),
                              ArrowButton(
                                function: () {
                                  boxData.decreaseQuantity();
                                },
                                height: height,
                                iconData: Icons.arrow_drop_down_outlined,
                              ),
                            ]),
                          ),
                          MyTextButton(
                            function: () {
                              try {
                                boxData.addObject(objectName!, quantity);
                              } on Exception catch (e) {
                                print(e);
                              }
                            },
                            text: "Ajouter Objet",
                            width: width * 0.1,
                          )
                        ],
                      ),
                      if (newObjects.isNotEmpty) ...[
                        const MyDivider(),
                        SizedBox(height: height * 0.01),
                        Text("Objects Ajoutés:", style: textStyleInfo),
                        SizedBox(
                          height: height * 0.25,
                          child: Material(
                            borderRadius: kRadius,
                            color: kAppBarColor.withOpacity(0.4),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.02),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: newObjectsLength,
                                  itemBuilder: (context, i) {
                                    final objectName =
                                        newObjects[(newObjectsLength - 1) - i]
                                            .name;
                                    final objectQuantity =
                                        newObjects[(newObjectsLength - 1) - i]
                                            .quantity;
                                    return AnObject(
                                      name: objectName!,
                                      quantity: objectQuantity!,
                                      index: i,
                                      length: newObjectsLength,
                                    );

                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "$i- $objectName ${objectQuantity ?? ": $quantity"}",
                                    //     ),
                                    //   ],
                                    // );
                                  }),
                            ),
                          ),
                        )
                      ],
                      SizedBox(height: height * 0.01),
                      const MyDivider(),
                    ],
                  ));
                })
              ],
            ),
            MyTextButton(
              function: () {},
              text: "Ajouter Catron",
              width: width * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
