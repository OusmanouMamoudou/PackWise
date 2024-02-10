import 'package:flutter/material.dart';

//Colors
const kBlue = Color(0xff173442);
const kAppBarColor = Color(0xffDE9C3E);
const kBackgroundColor = Color(0xffF2E1D2);
const kCardColor = Color(0xffF2CB70);

//Images
const kBox = "assets/box.png";
const kBoxAdd = "assets/boxadd.png";

// Input Decoration

const kInputDecoration = InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        width: 2.5,
      )),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide(
        width: 1.5,
      )),
);

// BorderRadius
const kRadius = BorderRadius.all(Radius.circular(15));
