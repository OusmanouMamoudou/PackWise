import 'package:flutter/material.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_icon_button.dart';
import 'package:pack_wise/components/my_snack_bar.dart';
import 'package:pack_wise/components/object_listview.dart';
import 'package:pack_wise/components/qr_view.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/services/box_data.dart';
import 'package:pack_wise/services/qrcode.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({super.key});

  static Future bottomSheet(BuildContext context, BoxData boxData, index) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();
    final boxes = boxData.boxes;
    final boxName = boxes[index].name;
    final boxDescription = boxes[index].description;
    final boxId = boxes[index].id;
    final boxObjects = boxes[index].objects;
    final qrViewData = boxes[index].toJsonString();

    final GlobalKey qrKey = GlobalKey();

    var textStyleInfo = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: height * 0.017,
      fontStyle: FontStyle.italic,
    );
    return showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MyDivider(),
                  Material(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: kCardColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        top: height * 0.02,
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                      boxName!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.03,
                                      ),
                                    ),
                                    Text(
                                      boxId!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: height * 0.02,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  MyIconButton(
                                    height: height,
                                    iconData: Icons.save_alt_rounded,
                                    function: () {
                                      Navigator.pop(context);
                                      QrCode().captureAndSavePng(
                                          context, qrKey, boxName);
                                      MySnackBar.mySnackBar(
                                        "$boxName enrégistré dans votre dossier de téléchargement"
                                        "(Download/PackWise)",
                                        context,
                                      );
                                    },
                                  ),
                                  MyIconButton(
                                    height: height,
                                    iconData: Icons.delete,
                                    function: () {
                                      boxData.deleteBox(boxId);
                                      MySnackBar.mySnackBar(
                                          "Vous venez de supprimer  $boxName",
                                          context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ]),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Text(
                            boxDescription!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: height * 0.025,
                            ),
                          ),
                        ),
                        const MyDivider(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          child: ObjectListView(
                              textStyleInfo: textStyleInfo,
                              height: height,
                              isInfo: true,
                              objects: boxObjects),
                        ),
                        QrView(
                          qrKey: qrKey,
                          data: qrViewData,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("");
  }
}
