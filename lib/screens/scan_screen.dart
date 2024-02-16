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
        Positioned(
          top: height * 0.15,
          child: Material(
              color:
                  result == null ? kAppBarColor.withOpacity(0.7) : kAppBarColor,
              elevation: 10,
              borderRadius: kRadius,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.02),
                child: Text(
                    result == null
                        ? "Trouvez un QrCode : PackWise"
                        : "Scannez un Qr généré par PackWise, SVP!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                      color: result == null ? kBackgroundColor : Colors.white,
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
          try {
            final box = Box.fromJsonString(result!.code!);
            Navigator.pop(context);
            BoxInfo.bottomSheet(context, null, null, box, true);
            stopScan = true;
          } catch (e) {
            print("ooooooooooooooooooo $e");
          }
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
