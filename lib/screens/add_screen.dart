import 'package:flutter/material.dart';

import 'package:pack_wise/components/arrow_button.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_snack_bar.dart';
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
  final formObjectKey = GlobalKey<FormState>();
  final formBoxKey = GlobalKey<FormState>();
  // final moveKey = GlobalKey();
  String? boxName, boxDescription, objectName;
  TextEditingController objectNameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();

    ScrollController scrollController = ScrollController();
    void autoScroll(double offset) {
      scrollController.animateTo(offset * 50,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    }

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
                  controller: scrollController,
                  shrinkWrap: true,
                  children: [
                    Form(
                        key: formBoxKey,
                        child: Column(
                          children: [
                            Text("Informations du Carton: ",
                                style: textStyleInfo),
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
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? "Entrez le nom du carton"
                                        : null,
                              ),
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
                                ),
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? "Entrez une description"
                                        : null,
                              ),
                            ),
                            const MyDivider(),
                            SizedBox(height: height * 0.01),
                            Column(
                              children: [
                                Text("Informations des Objects:",
                                    style: textStyleInfo),
                                SizedBox(height: height * 0.01),
                                Form(
                                  key: formObjectKey,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.01),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        objectName = value;
                                        autoScroll(2.5);
                                      },
                                      controller: objectNameCon,
                                      style: textStyleStyle,
                                      decoration: kInputDecoration.copyWith(
                                        labelText: "Nom d'objet",
                                        labelStyle: TextStyle(
                                            fontSize: height * 0.025,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      validator: (value) =>
                                          value == null || value.isEmpty
                                              ? "Entrez le nom d'object"
                                              : null,
                                    ),
                                  ),
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
                                            decoration:
                                                kInputDecoration.copyWith(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                height * 0.033),
                                                    hintText:
                                                        quantity.toString(),
                                                    hintStyle:
                                                        objectTextStyle)),
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
                                          iconData:
                                              Icons.arrow_drop_up_outlined,
                                        ),
                                        ArrowButton(
                                          function: () {
                                            boxData.decreaseQuantity();
                                          },
                                          height: height,
                                          iconData:
                                              Icons.arrow_drop_down_outlined,
                                        ),
                                      ]),
                                    ),
                                    MyTextButton(
                                      function: () {
                                        if (formObjectKey.currentState!
                                            .validate()) {
                                          boxData.addObject(
                                              objectName!, quantity);
                                          objectNameCon.clear();
                                          boxData.resetQuantity();
                                          objectName = null;
                                          autoScroll(3.5);
                                        }
                                      },
                                      text: "Ajouter Objet",
                                      width: width * 0.1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            if (newObjects.isNotEmpty) ...[
                              const MyDivider(),
                              SizedBox(height: height * 0.01),
                              Text("Objects Ajoutés:", style: textStyleInfo),
                              SizedBox(height: height * 0.01),
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
                  if (newObjects.isEmpty) {
                    MySnackBar.mySnackBar(
                        'Veuilez ajouter des objects dans votre Carton, SVP!',
                        context);
                  } else if (formBoxKey.currentState!.validate()) {
                    boxData.addBox(
                      boxName.toString(),
                      boxDescription.toString(),
                      newObjects,
                    );
                    boxData.clearObjects();
                    Navigator.pop(context);
                  }
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
