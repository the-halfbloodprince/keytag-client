import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hostel_keys_management/config/variables.dart';
import 'package:hostel_keys_management/utils.dart';
import 'package:http/http.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPageArgs {
  bool isExchangeRoute = false;
  ScanQRPageArgs(this.isExchangeRoute);
}

class ScanQrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      // print(result!.code);

      var args = ModalRoute.of(context)!.settings.arguments as ScanQRPageArgs;

      // send request
      // print(
      //     "${result!.code}${args.isExchangeRoute ? '/${generateNonce(context)}' : ''}");

      Response res = await post(
        Uri.parse(
            "${result!.code}${args.isExchangeRoute ? '/${generateNonce(context)}' : ''}"),
        headers: getHeaders(context),
      );

      var resBody = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
      // var data = resBody;

      // print(data);
      showSnackBar(
          context,
          'Done!',
          '${args.isExchangeRoute ? "Keys exchanged with guard!" : "Keys transferred successfully!"}',
          ContentType.success);

      // if (data == null) {
      // } else {
      //   showSnackBar(context, 'Unsuccessful', ContentType.failure);
      // }

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pop(context);

      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
