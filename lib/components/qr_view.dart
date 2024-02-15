import 'package:flutter/material.dart';
import 'package:pack_wise/components/screen_size.dart';
import 'package:pack_wise/const.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrView extends StatelessWidget {
  const QrView({
    super.key,
    required this.data,
    required this.qrKey,
  });
  final String data;
  final Key qrKey;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    double width = screenSize.width();
    double height = screenSize.height();
    return RepaintBoundary(
      key: qrKey,
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        embeddedImage: const AssetImage(kLogo),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(width * 0.15, height * 0.05),
        ),
        // ignore: deprecated_member_use
        foregroundColor: kBlue,
        backgroundColor: kAppBarColor,
        size: width * 0.5,
        gapless: true,
        errorStateBuilder: (ctx, err) {
          return const Center(
            child: Text(
              'Une Erreur se produite',
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
