import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../utils/colorz.dart';
import '../utils/helper.dart';
import 'custom_app_bar.dart';

class QrScreens extends StatefulWidget {
  final Function(String url) getUrl;
  const QrScreens({super.key, required this.getUrl});

  @override
  State<QrScreens> createState() => _QrScreensState();
}

class _QrScreensState extends State<QrScreens> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "QR Code Scanner",
      ),
      body: SizedBox(
        height: double.infinity,
        child: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {

    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colorz.main,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      this.controller?.pauseCamera();
      this.controller?.dispose();
      Barcode result = scanData;
      widget.getUrl(result.code.toString());
      Navigator.of(context).pop();
    });

  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {

      Navigator.of(context).pop();
      Helper.showSnackBar(
          context: context, text: "Please give camera permission");
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}