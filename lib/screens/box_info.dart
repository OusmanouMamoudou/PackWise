import 'package:flutter/material.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_icon_button.dart';
import 'package:pack_wise/components/object_listview.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/models/my_object.dart';

class BoxInfo extends StatelessWidget {
  const BoxInfo({super.key});

  static Future bottomSheet(BuildContext context, String name,
      String description, String date, String id, List<MyObject> objects) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();
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
                                      name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.03,
                                      ),
                                    ),
                                    Text(
                                      id,
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
                                    iconData: Icons.qr_code,
                                    function: () {},
                                  ),
                                  MyIconButton(
                                    height: height,
                                    iconData: Icons.delete,
                                    function: () {},
                                  ),
                                ],
                              ),
                            ]),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Text(
                            description,
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
                              objects: objects),
                        )
                      ]),
                    ),
                  )
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
