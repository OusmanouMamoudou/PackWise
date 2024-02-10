import 'package:flutter/material.dart';

import 'package:pack_wise/components/arrow_button.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_text_button.dart';
import 'package:pack_wise/components/object_listview.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController objectNameCon = TextEditingController();
  int id = 0;
  String? boxName, boxDescription, objectName;
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();

    var objectTextStyle = TextStyle(
      fontSize: height * 0.025,
      fontWeight: FontWeight.w900,
    );

    var textStyleInfo = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: height * 0.017,
      fontStyle: FontStyle.italic,
    );
    var textStyleStyle = TextStyle(
      fontSize: height * 0.02,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("PackWise")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
        ),
        child: Consumer<BoxData>(builder: (context, boxData, child) {
          final newObjects = boxData.newObjects;

          final quantity = boxData.getQuantity;
          return Column(
            children: [
              SizedBox(height: height * 0.02),
              Text(
                "Ajout d'un carton",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03,
                ),
              ),
              const MyDivider(),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Form(
                        child: Column(
                      children: [
                        Text("Informations du Carton: ", style: textStyleInfo),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
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
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
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
                        SizedBox(height: height * 0.01),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: TextFormField(
                              onChanged: (value) {
                                objectName = value;
                              },
                              controller: objectNameCon,
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
                                    style: objectTextStyle,
                                    decoration: kInputDecoration.copyWith(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: height * 0.033),
                                        hintText: quantity.toString(),
                                        hintStyle: objectTextStyle)),
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
                                boxData.addObject(objectName!, quantity);
                                setState(() {
                                  objectNameCon.clear();
                                });
                              },
                              text: "Ajouter Objet",
                              width: width * 0.1,
                            )
                          ],
                        ),
                        if (newObjects.isNotEmpty) ...[
                          ObjectListView(
                            height: height,
                            textStyleInfo: textStyleInfo,
                          )
                        ],
                      ],
                    ))
                  ],
                ),
              ),
              MyTextButton(
                function: () {
                  boxData.addBox(
                    boxName.toString(),
                    boxDescription.toString(),
                    newObjects,
                  );
                  boxData.clearObjects();
                  Navigator.pop(context);
                },
                text: "Ajouter Catron",
                width: width * 0.2,
              ),
            ],
          );
        }),
      ),
    );
  }
}
