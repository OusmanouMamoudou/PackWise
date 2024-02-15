import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:pack_wise/models/box.dart';
import 'package:pack_wise/screens/box_info.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  bool stopScan = false;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double height = screenSize.height();
    double width = screenSize.width();
    return Scaffold(
      appBar: AppBar(title: const Text("PackWise")),
      body: Stack(alignment: Alignment.center, children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            cutOutSize: height * 0.33,
            borderColor: kAppBarColor,
            borderLength: height * 0.030,
            borderRadius: height * 0.024,
            borderWidth: width * 0.024,
          ),
          onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
        ),
        if (result == null)
          Positioned(
            top: height * 0.15,
            child: Material(
                color: kAppBarColor.withOpacity(0.7),
                elevation: 10,
                borderRadius: kRadius,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.02),
                  child: Text("Trouvez un QrCode : PackWise",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02,
                        color: kBackgroundColor,
                      )),
                )),
          )
      ]),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      if (!stopScan) {
        setState(() {
          result = scanData;
          final box = Box.fromJsonString(result!.code!);
          Navigator.pop(context);
          BoxInfo.bottomSheet(context, null, null, box, true);
          stopScan = true;
        });
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}onPermissionSet $p' as num);
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Acune Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
