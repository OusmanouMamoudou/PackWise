import 'package:flutter/material.dart';

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  MediaQueryData getMediaQueryData() {
    return MediaQuery.of(context);
  }

  double width() {
    return getMediaQueryData().size.width;
  }

  double height() {
    return getMediaQueryData().size.height;
  }
}
