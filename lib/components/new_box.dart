import 'package:flutter/material.dart';
import 'package:pack_wise/components/my_divider.dart';
import 'package:pack_wise/components/my_form.dart';

class NewBox extends StatelessWidget {
  const NewBox({super.key});

  static Future bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 10,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  MyDivider(),
                  MyForm(),
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
