import 'dart:io';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QrCode {
  Future<void> captureAndSavePng(BuildContext context, qrKey, name) async {
    bool dirExists = false;
    dynamic externalDir = '/storage/emulated/0/Download/PackWise';

    RenderRepaintBoundary boundary =
        qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3.0);

    //Drawing White Background because Qr Code is Black
    final whitePaint = Paint()..color = Colors.white;
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
    canvas.drawRect(
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        whitePaint);
    canvas.drawImage(image, Offset.zero, Paint());
    final picture = recorder.endRecording();
    final img = await picture.toImage(image.width, image.height);
    ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    //Check for duplicate file name to avoid Override

    int i = 1;
    while (await File('$externalDir/$name.png').exists()) {
      name = '${name}_$i';
      i++;
    }

    // Check if Directory Path exists or not
    dirExists = await File(externalDir).exists();
    //if not then create the path
    if (!dirExists) {
      await Directory(externalDir).create(recursive: true);
      dirExists = true;
    }

    final file = await File('$externalDir/$name.png').create();
    await file.writeAsBytes(pngBytes);
  }
}
